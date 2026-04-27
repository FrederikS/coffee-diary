## Context

Coffee diary currently has pages for individual coffees but no way to browse all coffees in one view. The backend already has coffee data in Postgres; the frontend just needs a listing page.

For this initial version, we only show columns directly on the coffee entity — no relations (roastery, origins, tags, ratings, images). See DATAMODEL.md for the full schema.

## Goals / Non-Goals

**Goals:**
- Add `/coffees` route displaying all coffees in a table
- Show only direct coffee columns: name, type_id, arabica/robusta %, profile_description, price, link, created_at
- Link to individual coffee detail pages (future)

**Non-Goals:**
- Filtering, sorting, search (future)
- Pagination (future)
- Roastery name, origin countries, tags, ratings (future capabilities)
- Individual coffee detail view (future)

## Decisions

- **Display format**: Table view with sortable columns
- **Data fetching**: `coffees` query returning all coffees, no relations joined
- **Columns**: name, type_id (as number), arabica%, robusta%, price, link

## Risks / Trade-offs

- [Performance] Loading many coffees could be slow → Acceptable for v1 with small dataset
- [No roastery info] Users won't see which roastery → Will come in future capability