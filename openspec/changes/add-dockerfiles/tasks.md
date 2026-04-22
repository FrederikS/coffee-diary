## 1. Frontend Dockerfile

- [ ] 1.1 Create `frontend/Dockerfile` with multi-stage Node + Nginx build
- [ ] 1.2 Create `frontend/nginx.conf` with SPA routing configuration

## 2. Backend Container Image

- [ ] 2.1 Add `quarkus-container-image-docker` extension to backend pom.xml
- [ ] 2.2 Build and verify backend container image using Quarkus extension

## 3. Verification

- [ ] 3.1 Build frontend image locally and verify Nginx serves the SPA
- [ ] 3.2 Build backend image locally and verify Quarkus starts on port 8080