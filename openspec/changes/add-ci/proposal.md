## Why

The coffee-diary project currently has no automated builds or deployments. Container images are built and pushed manually, which is error-prone and doesn't provide traceability. Adding GitHub Actions workflows ensures consistent, reproducible builds with proper version tagging on every merge to main.

## What Changes

- Add GitHub Actions workflows to build, test, and publish both frontend and backend
- Add `build.yml` to build and test both projects on every push to any branch
- Add `release.yml` to build and publish container images on GitHub release (with release tag)
- Support multi-arch images (x86_64, aarch64) via Docker buildx
- Publish `latest` tag on every release
- Publish images to GitHub Container Registry (`ghcr.io`)

## Capabilities

### New Capabilities

- `github-actions-ci`: GitHub Actions workflows for automated container image builds and publishes

## Impact

- GitHub repository (`.github/workflows/`)
- Container image tags on ghcr.io
- No changes to application code, API, or database schema