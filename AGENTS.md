# coffee-diary — AGENTS.md

## What is this?

coffee-diary is a personal coffee catalogue and rating tracker. It provides a clean,
browsable UI over a curated coffee database — roasteries, coffees, origins, tasting
profiles, and personal ratings. The long-term goal is to accumulate enough structured
data to surface personal preference patterns (e.g. preferred origins, roast profiles,
arabica/robusta ratios).

---

## How the system works

Data is managed entirely via **Mathesar**, a self-hosted Postgres UI that acts as the
single source of truth and the only write path. coffee-diary never writes to the
database — it is a read-only view over the data Mathesar manages.

In v1, the API connects directly to the Mathesar-managed Postgres instance using a
dedicated read-only role. There is no separate read database or replication pipeline
at this stage.

```
Mathesar UI ──writes──▶ Postgres ◀──reads── API ◀── Vue SPA
```

---

## Technology stack

| Layer            | Technology                                                         |
|------------------|--------------------------------------------------------------------|
| Frontend         | Vue 3, TypeScript, Vite, pnpm                                      |
| Backend          | Java 25, Quarkus, GraphQL (SmallRye), Maven                        |
| Database         | PostgreSQL (managed via Mathesar, accessed read-only)              |
| Containerisation | Docker                                                             |
| Dev environment  | devenv (Nix-based, declarative)                                    |
| Local dev        | Docker Compose                                                     |
| CI               | GitHub Actions — builds and publishes container images             |
| Deployment       | Kubernetes (self-hosted, managed via a separate GitOps repository) |

Library choices within the frontend and backend (routing, state, ORM, etc.) are
decided per feature when first needed and documented in the relevant OpenSpec spec.

---

## Repository structure

```
coffee-diary/
├── frontend/                 # Vue SPA
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── router/
│   │   ├── stores/
│   │   └── types/
│   ├── Dockerfile
│   ├── nginx.conf
│   └── vite.config.ts
│
├── backend/                  # Quarkus GraphQL API
│   ├── src/main/java/codes/fdk/coffeediary/
│   │   ├── coffee/            # bounded context: coffee domain
│   │   │   ├── Coffee.java
│   │   │   ├── CoffeeRepository.java
│   │   │   ├── CoffeeService.java
│   │   │   └── CoffeeResolver.java
│   │   ├── roastery/          # bounded context: roastery domain
│   │   │   ├── Roastery.java
│   │   │   ├── RoasteryRepository.java
│   │   │   ├── RoasteryService.java
│   │   │   └── RoasteryResolver.java
│   │   ├── origin/            # bounded context: origin domain
│   │   └── rating/            # bounded context: rating domain
│   ├── Dockerfile
│   └── pom.xml
│
├── openspec/                 # Feature specs (OpenSpec)
│   └── specs/                # One folder per feature, covering both layers
│       └── example-feature/
│           ├── spec.md
│           ├── proposal.md
│           ├── design.md
│           └── tasks.md
│
├── .github/
│   └── workflows/
│       ├── frontend.yml      # Build & publish frontend container image
│       └── backend.yml       # Build & publish backend container image
│
├── docker-compose.yml
├── devenv.nix                # declarative dev environment (Java, Node, tooling)
├── devenv.yaml
├── .env.example
└── AGENTS.md
```

---

## Learning intent

Two architectural choices in this project are deliberately applied for learning
purposes, not because they are the optimal fit for the problem:

- **GraphQL** — the domain is simple and a REST API would suffice, but GraphQL is
  used intentionally to gain hands-on experience with schema design, resolvers, and
  query patterns. The agent should apply GraphQL idioms properly, not shortcuts.

---

## Key conventions

- **Read-only** — the GraphQL API exposes only queries in v1, no mutations
- **Single endpoint** — all queries are served at `/graphql`
- **Base package** — `codes.fdk.coffeediary`
- **Port conventions** — frontend runs on `3000`, backend on `8080` locally
- **Spec-driven features** — every new feature starts with an OpenSpec spec in
  `openspec/specs/<feature-name>/` before any code is written. Specs are
  feature-oriented, not layer-oriented — each spec describes the full vertical
  slice (what the API returns and what the UI shows)
- **Implement only what's specified** — do not add methods, fields, or functionality
  beyond what the spec explicitly requires. If additional capabilities are needed,
  update the spec first.
- **Secrets via environment** — no credentials hardcoded anywhere; local dev uses
  `.env`, production uses Kubernetes Secrets managed in the GitOps repo
- **No k8s manifests here** — Kubernetes manifests live in a separate GitOps
  repository. This repo's only deployment responsibility is publishing container
  images via CI
- **Maven wrapper** — always use `./mvnw` instead of `mvn` for Maven commands in the
  backend

---

## Testing requirements

Every change MUST include tests for both backend and frontend:

**Backend:**
- **Integration tests**: Quarkus Dev Services with PostgreSQL for API endpoint testing
- **Test data**: Use `backend/src/test/resources/db/init.sql` for seeded test data in integration tests

**Frontend:**
- **Unit/component tests**: Vitest + Vue Test Utils

---

## Data model

The full database schema, ERD, and table descriptions are documented in
[`backend/docs/DATAMODEL.md`](backend/docs/DATAMODEL.md). Read this before
working on any feature — every API and UI decision depends on it.

---

## Design system

The visual design system — color palette, typography, spacing, and component
guidelines — is documented in [`frontend/docs/DESIGN.md`](frontend/docs/DESIGN.md).
Read this before implementing any UI feature.

---

## CI / container images

GitHub Actions builds and pushes one image per app on merge to main:

- `ghcr.io/<org>/coffee-diary-ui:<tag>`
- `ghcr.io/<org>/coffee-diary-api:<tag>`

The GitOps repository picks up new image tags and applies them to the cluster using
the bjw-s app-template Helm chart.

---

## Local development

**devenv** manages all runtime dependencies declaratively via `devenv.nix` at the
repository root. Running `devenv shell` gives you the correct versions of Java, Node,
Maven, pnpm, and any other tooling without manual installation. This is the only
supported way to set up the development environment — do not suggest alternatives like
sdkman, nvm, or manual installs.

OpenSpec is included in `devenv.nix` as a package so that `openspec init` can be run
inside the devenv shell without a global install. The `openspec init` command should
be run as part of the initial project scaffolding.

Docker Compose runs the backing services locally:
- A local Postgres instance with optional seed data
- Quarkus in dev mode (hot reload) on port `8080`
- Vite dev server (hot reload) on port `3000`

All required environment variables are documented in `.env.example`.

---

## Future evolution

When schema flexibility or replayability becomes a need, the architecture will evolve
to introduce a worker and a dedicated read database between Mathesar's Postgres and the
API. This is additive — the v1 structure does not need to change, only extend.

```
Mathesar Postgres ──CDC──▶ Worker ──▶ Read Postgres ──▶ API ──▶ Vue SPA
```
