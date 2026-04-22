## Context

The project has two containerized applications: a Vue.js frontend and a Quarkus Java backend. Both have Dockerfiles. Container images are currently built and pushed manually, which is error-prone.

## Goals / Non-Goals

**Goals:**
- Build and test both projects on every push
- Publish container images on GitHub release (with release tag as image tag)
- Publish `latest` tag on every release

**Non-Goals:**
- Kubernetes deployment (handled by separate GitOps repo)
- End-to-end testing in CI
- Multi-platform builds
- Building/testing on PRs specifically (any push is sufficient)

## Decisions

1. **Use GitHub Container Registry (ghcr.io)**
   Rationale: Native to GitHub, no external credentials needed beyond `GITHUB_TOKEN`.

2. **Separate workflow files with reusable workflow pattern**
   Rationale: Build/test workflow triggers on push, release workflow triggers on release and calls the build workflow via `workflow_call`. This ensures the exact same build that was tested gets packaged.

3. **Rebuild for release**
   Rationale: Project is small, rebuild time is acceptable. Release workflow rebuilds the project rather than passing artifacts between workflows. Simplifies implementation.

4. **Cache dependencies**
   Rationale: Use cachix cache to speed up subsequent builds. The devenv binary cache speeds up Nix package installations.

5. **Different build strategies for frontend vs backend**
   - Frontend: Uses Docker buildx to build multi-arch images from downloaded `/dist` artifacts
   - Backend: Uses Quarkus `container-image-docker` extension with `quarkus.docker.buildx.platform=linux/amd64,linux/arm64` to build and push multi-arch images directly

5. **Publish only on release**
   Rationale: Build and test on every push, publish container images only on release events.

6. **Use release tag as image tag**
   Rationale: `v1.2.3` → image tag `1.2.3` (strip `v` prefix). Releases follow semver, ensuring predictable versioning.

7. **Use devenv to provision CI environment**
   Rationale: Project dependencies are defined via devenv. CI runners must use devenv to match the development environment, ensuring consistent toolchain versions (Java, Node, Maven, pnpm).

   Implementation: Use the [devenv GitHub Actions integration](https://devenv.sh/integrations/github-actions/):
   - `cachix/install-nix-action@v31` to install Nix
   - `cachix/cachix-action@v16` with `name: devenv` for binary cache
   - `nix profile add nixpkgs#devenv` to install devenv
   - Use `devenv shell <command>` to run commands in the devenv environment

## Risks / Trade-offs

- **Credentials rotation**: `GITHUB_TOKEN` is auto-rotated. Mitigation: Use short-lived tokens, no long-lived secrets needed.
- **Rate limiting**: ghcr.io has rate limits. Mitigation: Use commit SHA tags to enable cache hits.

## Open Questions

None.