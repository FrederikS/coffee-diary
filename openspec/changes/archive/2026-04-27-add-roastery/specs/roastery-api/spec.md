## ADDED Requirements

### Requirement: Roasteries query returns all roasteries
The GraphQL API SHALL return a list of all roasteries when querying `roasteries`.

#### Scenario: Fetch all roasteries
- **WHEN** client sends GraphQL query `{ roasteries { id name website } }`
- **THEN** API returns a list of all roasteries from the database

#### Scenario: Empty roastery list
- **WHEN** no roasteries exist in database
- **THEN** API returns an empty list

### Requirement: Single roastery query by ID
The GraphQL API SHALL return a single roastery when querying `roastery(id:)` with a valid ID.

#### Scenario: Fetch roastery by valid ID
- **WHEN** client sends `roastery(id: 1) { id name website }`
- **THEN** API returns the roastery with that ID

#### Scenario: Roastery not found
- **WHEN** client requests non-existent ID
- **THEN** API returns null (GraphQL nullable)

### Requirement: GraphQL endpoint at /graphql
The API SHALL serve GraphQL queries at the `/graphql` endpoint.

#### Scenario: GraphQL endpoint available
- **WHEN** client sends POST to `/graphql`
- **THEN** API processes GraphQL query and returns JSON response