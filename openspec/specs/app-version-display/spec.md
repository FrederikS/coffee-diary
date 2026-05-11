# App Version Display

Version display in footer, injected at build time from git tag.

## ADDED Requirements

### Requirement: Version is injected at build time

The application version SHALL be injected during the build process from the VERSION build-arg.

#### Scenario: Version passed via build-arg
- **WHEN** the Docker build is run with `--build-arg VERSION=v1.2.3`
- **THEN** the built application SHALL have access to the version via import.meta.env.VITE_APP_VERSION

#### Scenario: Version not provided in build
- **WHEN** the Docker build is run without a VERSION build-arg
- **THEN** import.meta.env.VITE_APP_VERSION SHALL be undefined

### Requirement: Footer displays version when available

The application footer SHALL display the version when it is provided during the build.

#### Scenario: Version displayed in footer
- **WHEN** VITE_APP_VERSION is defined
- **THEN** the footer SHALL display the version without "v" prefix (e.g., "1.2.3")

#### Scenario: Version defaults to 'dev' in dev builds
- **WHEN** VITE_APP_VERSION is undefined (non-release build)
- **THEN** the footer SHALL display "dev"

### Requirement: Version is displayed without v prefix

The version SHALL be displayed without the "v" prefix regardless of how it's passed to the build.

#### Scenario: Version v prefix is stripped
- **WHEN** VERSION build-arg is "v1.2.3"
- **THEN** the footer SHALL display "1.2.3" (v prefix removed)