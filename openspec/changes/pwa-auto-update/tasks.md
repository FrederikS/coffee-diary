## 1. Add and configure vite-plugin-pwa

- [ ] 1.1 Install vite-plugin-pwa as dev dependency in frontend
- [ ] 1.2 Add PwaVue plugin to vite.config.ts
- [ ] 1.3 Configure auto-update with skipWaiting and clientsClaim
- [ ] 1.4 Configure caching strategies (StaleWhileRevalidate for assets, NetworkFirst for navigation)
- [ ] 1.5 Generate service worker on build

## 2. Update PWA manifest

- [ ] 2.1 Update site.webmanifest with name: "Coffee-Diary"
- [ ] 2.2 Add short_name: "Coffee-Diary"
- [ ] 2.3 Add start_url: "/"
- [ ] 2.4 Add scope: "/"

## 3. Configure version injection

- [ ] 3.1 Update vite.config.ts to use define option for VITE_APP_VERSION
- [ ] 3.2 Reference VERSION environment variable (passed via build-arg)

## 4. Add version display component

- [ ] 4.1 Create AppFooter component in frontend/src/components/
- [ ] 4.2 Display version from import.meta.env.VITE_APP_VERSION when defined
- [ ] 4.3 Hide version when undefined (dev builds)
- [ ] 4.4 Add AppFooter to App.vue

## 5. Update CI/CD for version injection

- [ ] 5.1 Update .github/workflows/release.yml to pass VERSION as --build-arg
- [ ] 5.2 Update frontend/Dockerfile to accept ARG VERSION
- [ ] 5.3 Pass VERSION to pnpm build command in Dockerfile

## 6. Testing

- [ ] 6.1 Run frontend build and verify service worker is generated
- [ ] 6.2 Verify version is injected when VERSION is passed
- [ ] 6.3 Verify footer displays version in production build
- [ ] 6.4 Run tests: pnpm test
- [ ] 6.5 Verify service worker registers correctly in browser