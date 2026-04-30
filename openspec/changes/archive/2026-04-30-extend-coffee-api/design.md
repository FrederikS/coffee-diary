## Context

The `Coffee` entity currently has no JPA relationship mappings, even though the database has foreign keys to `roastery`, `coffee_type`, and join tables for countries, profile tags, images, and ratings. The GraphQL API exposes these as basic fields with no relations.

## Goals / Non-Goals

**Goals:**
- Add JPA `@OneToMany` and `@ManyToOne` mappings to the `Coffee` entity for all existing relations
- Rename `CoffeeResolver` → `CoffeeResource` for naming consistency with `RoasteryResource`
- Configure fetch joins in repository to prevent N+1 queries when loading coffee lists

**Non-Goals:**
- Add new database tables or schema changes
- Add mutations (write operations) — read-only for v1
- Create new GraphQL queries (reuse existing `coffees` query)

## Decisions

### 1. Entity relationship mapping approach
**Decision:** Use JPA `ManyToOne` for single relations (roastery, type), `OneToMany` with `@JoinTable` for collections (countries, profileTags, images, ratings).

**Rationale:** Matches existing database structure. Join tables exist for many-to-many relationships.

### 2. Fetch strategy to avoid N+1
**Decision:** Use `FetchType.LAZY` on all relations, load with explicit JOIN FETCH in repository query.

**Rationale:** LAZY is default and safe. Explicit fetch join in repository gives control over which relations to load per query.

**Gap — Not yet implemented:** The current `CoffeeRepository.findAllCoffees()` uses `listAll()` with no fetch joins.

### 2.1 GraphQL resolver N+1 risk
**Decision:** Use JPQL JOIN FETCH in repository to preload all needed relations in a single query, avoiding N+1 at GraphQL resolution time.

**Rationale:** Even with LAZY + JOIN FETCH in JPQL, GraphQL can trigger additional queries when resolving nested fields per-item. Proper JPQL fetch joins preloads data upfront.

**Alternative considered:** GraphQL DataLoader (batch loading) — adds complexity, may not be needed for v1 with proper JPQL fetch joins.

### 3. Naming convention for GraphQL API components
**Decision:** All GraphQL API entrypoints use `*Resource` suffix (e.g., `CoffeeResource`, `RoasteryResource`).

**Rationale:** Consistency with existing `RoasteryResource`. Future API components follow the same pattern.

## Risks / Trade-offs

- **Risk:** Large response payload if all relations fetched eagerly → **Mitigation:** Only fetch required relations for list view, lazy-load optional data
- **Risk:** Circular references (coffee → roastery → coffee) → **Mitigation:** Use DTOs or GraphQL DataLoader patterns if needed
- **Risk:** N+1 still occurs at GraphQL resolver layer → **Mitigation:** Implement JPQL JOIN FETCH queries in repository to preload all needed data in one query
- **Risk:** Repository not using fetch joins → **Mitigation:** Will be addressed in implementation tasks