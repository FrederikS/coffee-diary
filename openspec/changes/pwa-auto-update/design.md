## Context

**Background:**
- The frontend currently has no service worker configured
- Manifest is minimal (no name, start_url, scope)
- Nginx has aggressive caching (1 year immutable for assets)
- No version display in the app

**Current Architecture:**
```
Nginx (1y cache) → Browser HTTP cache → App
(no service worker)
```

**Target Architecture:**
```
Service Worker (stale-while-revalidate) → Browser cache → App
                                                        ↓
                                              Version in footer
```

## Goals / Non-Goals

**Goals:**
- Auto-update the PWA in the background when a new version is deployed
- Display the current version in the app footer
- Proper PWA manifest so iOS/Android recognize it as an installable app

**Non-Goals:**
- Manual refresh mechanism (pull-to-refresh)
- Update notification to user
- Version history or change tracking
- Offline support (beyond default service worker caching)

## Decisions

### 1. Service Worker: vite-plugin-pwa

**Decision:** Use `vite-plugin-pwa` instead of writing a manual service worker.

**Rationale:**
- Standard solution for Vite projects
- Uses Workbox under the hood (well-maintained)
- Provides sensible defaults while allowing customization
- Has built-in support for auto-update patterns

### 2. Auto-Update Strategy: skipWaiting + clientsClaim

**Decision:** Configure service worker with `skipWaiting: true` and `clientsClaim: true`.

**Rationale:**
- `skipWaiting`: New service worker doesn't wait for old tabs to close, activates immediately
- `clientsClaim`: New service worker takes control of existing clients immediately
- Combined: User gets the new version on next navigation with no user action needed

**Alternative considered:** `registerType: 'manual'` with user-initiated update - but that requires extra UI and defeats the "seamless" goal.

### 3. Caching Strategy

**Decision:**
- Navigation (index.html): `NetworkFirst` - ensures fresh HTML on each request
- Static assets (JS, CSS, images): `StaleWhileRevalidate` - fast load from cache, background update

**Rationale:**
- NetworkFirst for navigation: Ensures users always get the latest app shell, which may reference new JS/CSS
- StaleWhileRevalidate for assets: Serve immediately from cache for speed, fetch updates in background for next visit

### 4. Version Injection: Build-time via build-arg

**Decision:** Pass version as `--build-arg` to Docker, inject into Vite via `define` option.

**Flow:**
```
release.yml: --build-arg VERSION=${GITHUB_REF_NAME#v}
                ↓
frontend/Dockerfile: ARG VERSION, pass to build
                ↓
vite.config.ts: define: { VITE_APP_VERSION: VERSION }
                ↓
Footer component: import.meta.env.VITE_APP_VERSION
```

**Rationale:**
- No need to sync package.json with git tags
- Version comes from the authoritative source (git tag) at build time
- Clean separation between CI and source code

### 5. Fallback for Non-Release Builds

**Decision:** On non-release builds (no VERSION build-arg), the version variable will be undefined. The footer component will not display a version in this case.

**Rationale:**
- Only production releases need to show version
- Dev/staging builds don't need to display a specific version
- Simpler than trying to pass branch name or SHA

### 6. Manifest Updates

**Decision:** Add the following to the manifest:
- `name`: "Coffee-Diary"
- `short_name`: "Coffee-Diary"
- `start_url`: "/"
- `scope`: "/"

**Rationale:**
- Required for iOS "Add to Homescreen" to show a proper name
- start_url and scope ensure the PWA covers the entire app

## Risks / Trade-offs

### iOS PWA Limitations

**[Risk]** iOS Safari has different PWA behavior than Chrome/Android.
- Service worker support in iOS standalone mode is improving but not as robust
- Pull-to-refresh doesn't work in standalone mode (not in scope, but relevant)

**[Mitigation]** Test on actual iOS device. The auto-update should still work because it happens on navigation (user opens the app), not via background sync.

### Service Worker Not Supported

**[Risk]** Some browsers or environments don't support service workers.

**[Mitigation]** The app works fine without a service worker - it just relies on HTTP caching. This is the current behavior, so we're not breaking anything.

### Docker Build Context

**[Risk]** The ARG VERSION needs to be passed to the build. If not passed, Vite gets undefined.

**[Mitigation]** The footer component handles undefined gracefully (doesn't display anything).

### Nginx Cache Conflict

**[Risk]** Nginx already caches assets with `Cache-Control: public, immutable`. If service worker caches differently, there could be conflicts.

**[Mitigation]** Service worker cache takes precedence over HTTP cache for requests it intercepts. This is the desired behavior.

## Migration Plan

1. **Deploy:**
   - Merge changes to main
   - CI builds and pushes new container images
   - Kubernetes/gitops deploys the new version

2. **User Experience:**
   - Existing PWA users will get the update on their next app open
   - New users who add to homescreen get the full PWA experience

3. **Rollback:**
   - Standard Kubernetes rollback via gitops
   - Users may need to clear browser data for service worker to reset

## Open Questions

1. **Testing:** Should we verify the service worker works on actual iOS device before deploying to production?

2. **Manifest icons:** The current manifest references icons. Are they properly sized for PWA install prompts on iOS/Android?

3. **Future enhancement:** Would pull-to-refresh be desired later as a fallback? (Not in scope for now)