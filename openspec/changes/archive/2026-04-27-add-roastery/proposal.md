## Why

First feature implementation for coffee-diary. Roastery is the parent entity for coffee in the data model, making it a logical starting point to expose via the GraphQL API. The UI needs roastery data to display before introducing the coffee entity.

## What Changes

- Add **SmallRye GraphQL** for the API layer
- Add **Panache** with repository pattern for ORM
- Add **PostgreSQL JDBC** driver
- Add **Quarkus Dev Services** for PostgreSQL in integration tests
- Create **roastery** package:
  - `Roastery.java` (JPA entity)
  - `RoasteryRepository.java` (Panache repository)
  - `RoasteryService.java` (service layer)
  - `RoasteryResource.java` (GraphQL query resolver)
- Configure datasource in `application.properties`
- Add **integration tests** for GraphQL API endpoints
- **Frontend**: Create roastery detail page displaying roastery info

## Capabilities

### New Capabilities
- `roastery-api`: Expose roastery data via GraphQL query (`roasteries`, `roastery(id)`)
- `roastery-entity`: Roastery JPA entity
- `roastery-detail-page`: Frontend page displaying roastery details

### Modified Capabilities
None - this is the first feature.

## Impact

- **Backend**: New dependencies, new package under `codes.fdk.coffeediary.roastery`
- **Database**: Read-only connection to existing `roastery` table
- **API**: New endpoint at `/graphql` with roastery queries
- **Frontend**: New roastery detail page (`/roastery/:id`)
- **Testing**: Integration tests with Quarkus Dev Services (mandatory)