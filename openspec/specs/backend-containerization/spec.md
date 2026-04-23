# backend-containerization Specification

## Purpose

Containerized deployment requires production-ready Docker images for both the frontend and backend services. The project uses Kubernetes for deployment, which needs container images to be available in a container registry. The Dockerfile definitions are the foundation for building and publishing those images via CI.

## Requirements
### Requirement: Backend container runs on Java 25 LTS

The backend container image SHALL run on Java 25 (the current LTS version). The Quarkus extension SHALL build with Java 25 and the runtime image SHALL use a Java 25 compatible JRE base image.

#### Scenario: Java version is correct
- **WHEN** the backend container starts
- **THEN** `java -version` outputs version 25

### Requirement: Backend uses Quarkus container-image-docker extension

The backend SHALL add the `quarkus-container-image-docker` Maven extension and use it to build container images via Docker. The build command SHALL use `quarkus.container-image.build=true` and push via `quarkus.container-image.push=true`.

#### Scenario: Container image extension is configured
- **WHEN** Maven builds the backend with `-Dquarkus.container-image.build=true`
- **THEN** the image builds using the Dockerfile at `src/main/docker/Dockerfile.jvm`

#### Scenario: Container starts the application
- **WHEN** the backend container starts
- **THEN** the Quarkus application starts and listens on port 8080

