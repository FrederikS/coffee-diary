## 1. Build Workflow (build.yml - reusable)

- [x] 1.1 Create `.github/workflows/build.yml` workflow file
- [x] 1.2 Add `on: push` trigger for all branches
- [x] 1.3 Provision build environment with devenv shell
- [x] 1.4 Add frontend job: compile project (pnpm build)
- [x] 1.5 Add frontend job: run tests (pnpm test)
- [x] 1.6 Add frontend job: upload artifacts (`actions/upload-artifact`)
- [x] 1.7 Add backend job: run build + tests (`./mvnw -U verify`)
- [x] 1.8 Add backend job: upload artifacts (`actions/upload-artifact`)

## 2. Release Workflow (release.yml)

- [x] 2.1 Create `.github/workflows/release.yml` workflow file
- [x] 2.2 Add `on: release` trigger configuration
- [x] 2.3 Call build.yml as reusable workflow
- [x] 2.4 Download artifacts from build workflow
- [x] 2.5 Setup Docker buildx with QEMU for multi-arch support
- [x] 2.6 Configure ghcr.io login with `GITHUB_TOKEN`
- [x] 2.7 Add frontend build job for `linux/amd64` and `linux/arm64`
- [x] 2.8 Add backend build using Quarkus container-image-docker extension
- [x] 2.9 Configure image tagging (strip `v` prefix from release tag)
- [x] 2.10 Configure manifest creation for multi-arch images
- [x] 2.11 Configure push with both release tag and `latest`
- [x] 2.12 Set image naming convention `ghcr.io/<org>/coffee-diary-{ui,api}:<tag>`

## 3. Verification

- [ ] 3.1 Verify workflow syntax for both files
- [ ] 3.2 Confirm devenv provisioning works in runner