## Why

The coffee API currently returns only basic coffee fields (id, name, arabica, robusta, profileDescription, price, link, createdAt). The UI needs richer data to display more informative coffee cards — including roastery information, origin countries, tasting profile tags, images, and ratings. Without these relations, users see incomplete information about each coffee.

## What Changes

- **Rename** `CoffeeResolver.java` → `CoffeeResource.java` for naming consistency with other GraphQL API components
- **Extend** the `Coffee` entity with JPA relationships to access related data
- **Add** relation fields to GraphQL schema: roastery, type, countries, profileTags, images, ratings
- **Modify** the `getCoffees` query to return enriched coffee objects with all relations populated
- No database schema changes (data already exists in Mathesar-managed tables)

## Capabilities

### New Capabilities
- `enriched-coffee-data`: Return full coffee objects with all relations (roastery, type, origins, tags, images, ratings) via the existing `coffees` query

### Modified Capabilities
- `coffee-api`: The existing `coffees` query will now return enriched coffee objects instead of basic fields. The requirement for "returns all coffees" remains, but the data shape changes to include relations.

## Impact

- **Backend**: Rename `CoffeeResolver.java` → `CoffeeResource.java`, modify `Coffee.java` entity, update `CoffeeRepository.java` with fetch joins, extend `CoffeeResource.java` if needed
- **Frontend**: Consume new GraphQL response shape, display additional coffee details in UI
- **No breaking API contract change** — still uses the same `coffees` query name, but returns richer objects