## 1. Add and configure vite-plugin-pwa

- [x] 1.1 Install vite-plugin-pwa as dev dependency in frontend
- [x] 1.2 Add PwaVue plugin to vite.config.ts
- [x] 1.3 Configure auto-update with skipWaiting and clientsClaim
- [x] 1.4 Configure caching strategies (StaleWhileRevalidate for assets, NetworkFirst for navigation)
- [x] 1.5 Generate service worker on build

## 2. Update PWA manifest

- [x] 2.1 Update site.webmanifest with name: "Coffee-Diary"
- [x] 2.2 Add short_name: "Coffee-Diary"
- [x] 2.3 Add start_url: "/"
- [x] 2.4 Add scope: "/"

## 3. Configure version injection

- [x] 3.1 Update vite.config.ts to use define option for VITE_APP_VERSION
- [x] 3.2 Reference VERSION environment variable (passed via build-arg)

## 4. Add version display component

- [x] 4.1 Create AppFooter component in frontend/src/components/
- [x] 4.2 Display version from import.meta.env.VITE_APP_VERSION when defined
- [x] 4.3 Hide version when undefined (dev builds)
- [x] 4.4 Add AppFooter to App.vue

## 5. Update CI/CD for version injection

- [x] 5.1 Update .github/workflows/release.yml to pass VERSION as --build-arg
- [x] 5.2 Update frontend/Dockerfile to accept ARG VERSION
- [x] 5.3 Pass VERSION to pnpm build command in Dockerfile

## 6. Testing

- [x] 6.1 Run frontend build and verify service worker is generated
- [x] 6.2 Verify version is injected when VERSION is passed
- [x] 6.3 Verify footer displays version in production build
- [x] 6.4 Run tests: pnpm test
- [x] 6.5 Verify service worker registers correctly in browser