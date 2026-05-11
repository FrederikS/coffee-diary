## Why

PWA users on iOS (and other platforms) don't see app updates immediately after a new release. There's no service worker configured, so the app relies on browser defaults. Users have no way to manually refresh the PWA to get the latest version.

## What Changes

- Add vite-plugin-pwa with auto-update (skipWaiting + clientsClaim)
- Update PWA manifest with Coffee-Diary name, start_url, scope
- Add version display in footer (injected at build time via --build-arg)
- Update release.yml to pass version as build-arg to Docker
- Update frontend/Dockerfile to accept and pass version to build
- Update vite.config.ts to inject version from build-arg

## Capabilities

### New Capabilities

- `pwa-auto-update`: Service worker configuration for auto-updating the PWA in the background
- `app-version-display`: Version display in footer, injected at build time from git tag

### Modified Capabilities

- None

## Impact

- **Frontend**: Add vite-plugin-pwa dependency, update vite.config.ts, update manifest.json, add footer component
- **CI**: Update release.yml to pass VERSION as --build-arg
- **Docker**: Update frontend/Dockerfile to accept ARG VERSION and pass to build