## Context

The backend is currently empty (only placeholder REST endpoints). Database schema exists via Mathesar with `roastery` table containing `id`, `name`, `website`. Postgres runs locally via Docker Compose. The API should be read-only, connecting to the existing `coffeediary` user.

## Goals / Non-Goals

**Goals:**
- Expose roastery data via GraphQL queries at `/graphql`
- Use Panache with repository pattern (not active record)
- Read-only access to Postgres

**Non-Goals:**
- No mutations (writes only via Mathesar)
- No authentication/authorization layer
- No Frontend changes yet

## Decisions

| Decision | Rationale |
|----------|-----------|
| **Panache + Repository** | ORM with repository pattern to preserve layering |
| **SmallRye GraphQL** | Quarkus-standard GraphQL implementation, used in AGENTS.md |
| **Plain entity (no DTOs initially)** | Keep it simple - roastery has 3 fields, direct mapping suffices |
| **Quarkus Dev Services** | Auto-starts PostgreSQL Testcontainer for integration tests |

### Alternatives Considered

- **Plain JDBC**: Too much boilerplate
- **Spring Data + Active Record**: Not idiomatic to Quarkus; Panache is the Quarkus way

## Risks / Trade-offs

- **GraphQL schema changes**: Schema is contract with frontend. → Keep queries stable once defined.

## Open Questions

- Do we expose images through roastery (via `roastery_image` join table)? → Defer to later feature.
- Should we add basic test infrastructure now or later? → Include test deps in dependencies, tests can come later.