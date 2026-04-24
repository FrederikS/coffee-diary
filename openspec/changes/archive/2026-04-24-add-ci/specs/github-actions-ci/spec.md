## ADDED Requirements

### Requirement: Build and test on push
The system SHALL build (compile) and test both the frontend and backend on every push to any branch.

#### Scenario: Build test on push to feature branch
- **WHEN** a commit is pushed to any branch
- **THEN** the workflow SHALL provision the build environment using devenv
- **AND** install dependencies (with caching for faster builds)
- **AND** compile the frontend project
- **AND** run frontend tests
- **AND** compile the backend project
- **AND** run backend tests

### Requirement: Publish images on release
The system SHALL publish container images to ghcr.io when a GitHub release is created.

#### Scenario: Publish on release creation
- **WHEN** a GitHub release is published with tag `v1.2.3`
- **THEN** the release workflow SHALL call the build workflow as a reusable workflow
- **AND** build frontend container image
- **AND** build and push backend container image using Quarkus container-image-docker extension
- **AND** tag the images with `1.2.3` (stripped `v` prefix)
- **AND** tag the images with `latest`
- **AND** push all images to ghcr.io

#### Scenario: Image naming
- **WHEN** images are published
- **THEN** frontend image SHALL be named `ghcr.io/<org>/coffee-diary-ui:<tag>`
- **AND** backend image SHALL be named `ghcr.io/<org>/coffee-diary-api:<tag>`

### Requirement: Multi-architecture images
The system SHALL produce container images for both x86_64 and aarch64 architectures.

#### Scenario: Multi-arch build
- **WHEN** a release triggers a publish
- **THEN** the workflow SHALL build images for `linux/amd64` and `linux/arm64`
- **AND** create a manifest for multi-arch image indexing