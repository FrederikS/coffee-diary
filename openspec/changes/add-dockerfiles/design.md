## Context

The coffee-diary project targets Kubernetes deployment via a separate GitOps repository. Container images must be built and pushed to a registry (GHCR) for the cluster to pull. The frontend serves a Vue SPA that requires server-side routing support, and the backend runs a Quarkus JVM application.

## Goals / Non-Goals

**Goals:**
- Multi-stage builds to minimize final image size
- Production-ready configurations for both services
- SPA routing support for the frontend

**Non-Goals:**
- Local development Docker Compose configurations (existing setup is adequate)
- Native compilation for the backend (JVM image is sufficient)
- Multi-arch image support (amd64 only for now)

## Decisions

### Frontend: Multi-stage Node + Nginx build

Build the Vue SPA in a Node container, then serve the static artifacts from Nginx. This is the standard pattern for Vue/React SPAs.

**Alternative considered:** Vite preview server — not suitable for production; lacks stability and features compared to Nginx.

**Nginx config:** SPA routes (`/` and all subpaths) must return `index.html` to support Vue Router's client-side navigation.

### Backend: Quarkus container-image-docker extension

Use the `quarkus-container-image-docker` extension to build container images using the existing Dockerfiles at `src/main/docker/`. This is the idiomatic Quarkus approach. The extension uses Docker/Podman binary to build images from the provided Dockerfiles.

**Alternative considered:** Manual Dockerfile at root level — doesn't integrate with Quarkus configuration; requires separate build commands outside Maven.

**Configuration:** Set `quarkus.container-image.build=true` and `quarkus.container-image.push=true` during CI builds. The extension reads the existing `src/main/docker/Dockerfile.jvm` automatically.

### Image naming convention

Images follow `ghcr.io/<org>/coffee-diary-<service>:<tag>` where service is `ui` or `api`.

## Risks / Trade-offs

- **Backend image size:** OpenJDK JRE images are larger than distroless or Alpine variants. Mitigation: Use Eclipse Temurin slim images (~150MB vs ~500MB for full JDK).
- **Build cache invalidation:** Copying `package.json`/`pom.xml` before source code maximizes Docker layer cache reuse during builds.

## Open Questions

None — the approach is well-established for these tech stacks.