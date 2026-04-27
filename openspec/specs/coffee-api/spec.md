# coffee-api Specification

## Purpose

Serves coffee data to the UI and other consumers.

## Requirements
### Requirement: Coffees query returns all coffees
The GraphQL API SHALL return a list of all coffees when querying `coffees`.

#### Scenario: Fetch all coffees
- **WHEN** client sends GraphQL query `{ coffees { id name arabica robusta profileDescription price link createdAt } }`
- **THEN** API returns a list of all coffees from the database

#### Scenario: Empty coffee list
- **WHEN** no coffees exist in database
- **THEN** API returns an empty list

### Requirement: GraphQL endpoint at /graphql
The API SHALL serve GraphQL queries at the `/graphql` endpoint.

#### Scenario: GraphQL endpoint available
- **WHEN** client sends POST to `/graphql`
- **THEN** API processes GraphQL query and returns JSON response

