## Why

The coffee diary currently lacks a basic overview page that displays all coffees in the catalogue. Users need a way to browse and discover coffees before viewing individual details or adding ratings.

## What Changes

- Add a new "Coffees" page that lists all coffees from the database
- Display coffee cards showing key info (name, roastery, origin, roast level)
- Link each card to a detail page
- Add GraphQL query to fetch all coffees

## Capabilities

### New Capabilities
- `coffee-overview`: A browsable listing page showing all coffees in the catalogue with summary information

### Modified Capabilities
None - this is a net new feature.

## Impact

- New frontend page at `/coffees`
- New GraphQL query `coffees` returning list of coffees
- Affected: frontend router, Vue components, backend GraphQL schema