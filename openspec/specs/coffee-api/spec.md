# coffee-api Specification

## Purpose

Serves coffee data to the UI and other consumers.

## Requirements

## MODIFIED Requirements

### Requirement: Coffees query returns enriched coffee objects
The GraphQL API SHALL return coffee objects with all relations populated when querying `coffees`.

#### Scenario: Fetch all coffees with basic fields
- **WHEN** client sends GraphQL query `{ coffees { id name arabica robusta profileDescription price link createdAt } }`
- **THEN** API returns a list of all coffees from the database

#### Scenario: Fetch coffees with roastery and type
- **WHEN** client sends GraphQL query `{ coffees { id name roastery { id name website } type { id value } } }`
- **THEN** API returns list of coffees, each including nested roastery and type objects

#### Scenario: Fetch coffees with origin countries
- **WHEN** client sends GraphQL query `{ coffees { id name countries { id name } } }`
- **THEN** API returns list of coffees, each including list of origin countries

#### Scenario: Fetch coffees with profile tags
- **WHEN** client sends GraphQL query `{ coffees { id name profileTags { id value } } }`
- **THEN** API returns list of coffees, each including list of profile tags

#### Scenario: Fetch coffees with images
- **WHEN** client sends GraphQL query `{ coffees { id name images { id sourceUrl } } }`
- **THEN** API returns list of coffees, each including list of images sorted by display order

#### Scenario: Fetch coffees with ratings
- **WHEN** client sends GraphQL query `{ coffees { id name ratings { id rating drinkType { id value } } }`
- **THEN** API returns list of coffees, each including list of ratings with optional drink type

#### Scenario: No N+1 queries on coffee list fetch
- **WHEN** client requests coffees with nested relations
- **THEN** API returns all coffees with relations efficiently (single query or minimal queries)

#### Scenario: Empty coffee list
- **WHEN** no coffees exist in database
- **THEN** API returns an empty list

### Requirement: GraphQL endpoint at /graphql
The API SHALL serve GraphQL queries at the `/graphql` endpoint.

#### Scenario: GraphQL endpoint available
- **WHEN** client sends POST to `/graphql`
- **THEN** API processes GraphQL query and returns JSON response