## Why

Containerized deployment requires production-ready Docker images for both the frontend and backend services. The project uses Kubernetes for deployment, which needs container images to be available in a container registry. The Dockerfile definitions are the foundation for building and publishing those images via CI.

## What Changes

- Add `frontend/Dockerfile` — multi-stage build serving Vue SPA via Nginx
- Add `backend/Dockerfile` — multi-stage build for Quarkus application
- Add `frontend/nginx.conf` — production Nginx configuration for SPA routing

## Capabilities

### New Capabilities
- `frontend`: Frontend container image with multi-stage Node + Nginx build
- `backend`: Backend container image with multi-stage Maven + OpenJDK build

### Modified Capabilities
- None

## Impact

- Frontend: `frontend/Dockerfile`, `frontend/nginx.conf`
- Backend: `backend/Dockerfile`
- Enables containerized deployment on Kubernetes