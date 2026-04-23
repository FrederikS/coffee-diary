Reference: [Docker - Containerize a Vue.js Application](https://docs.docker.com/guides/vuejs/containerize/)

## ADDED Requirements

### Requirement: Frontend uses multi-stage build with Node and Nginx

The `frontend/Dockerfile` SHALL use a multi-stage build:
1. Build stage: Node.js compiles the Vue application to static assets in `dist/`
2. Runtime stage: Nginx serves the static assets

#### Scenario: Frontend image builds successfully
- **WHEN** Docker builds the frontend Dockerfile
- **THEN** the image builds without errors and contains the compiled SPA assets in `/usr/share/nginx/html`

#### Scenario: Frontend container serves the application
- **WHEN** the frontend container starts
- **THEN** Nginx serves the SPA on port 8080 and returns `index.html` for all non-file routes

### Requirement: Frontend Dockerfile optimizes build caching

The Dockerfile SHALL copy `package.json` and `package-lock.json` before copying source code to leverage Docker layer caching during dependency installation.

#### Scenario: Build cache is utilized
- **WHEN** only source files change (not dependencies)
- **THEN** the dependency installation layer is cached and not rebuilt

### Requirement: Frontend container runs as non-root user

The final image SHALL run Nginx as a non-root user for security best practices.

#### Scenario: Container runs securely
- **WHEN** the container process is inspected
- **THEN** the process runs as user `nginx` (UID 101)

### Requirement: Nginx serves SPA routes correctly

The `frontend/nginx.conf` SHALL configure Nginx to serve `index.html` for any route that does not match a static file, enabling Vue Router's client-side navigation.

#### Scenario: Client-side navigation works
- **WHEN** a request is made to `/coffee/1` (a non-existent file path)
- **THEN** Nginx returns `index.html` with HTTP 200

### Requirement: Nginx enables gzip compression

The `frontend/nginx.conf` SHALL enable gzip compression to reduce payload size for text-based assets.

#### Scenario: Compression is applied
- **WHEN** a client requests a JavaScript file with `Accept-Encoding: gzip`
- **THEN** Nginx responds with gzip-encoded content

### Requirement: Nginx configures browser caching for static assets

The `frontend/nginx.conf` SHALL set `Cache-Control` headers for static assets (images, fonts, JS, CSS) with a 1-year expiry.

#### Scenario: Static assets are cached
- **WHEN** a browser requests `/assets/logo.png`
- **THEN** the response includes `Cache-Control: public, immutable` with 1-year max-age