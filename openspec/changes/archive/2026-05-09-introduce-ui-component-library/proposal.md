## Why

The coffee diary frontend currently uses basic HTML tables for displaying the coffee list. While functional, this lacks modern UI patterns like sorting, filtering, pagination, and responsive design. PrimeVue is a mature, feature-rich Vue 3 component library with a comprehensive set of UI components. It offers excellent Data Table functionality with built-in sorting, filtering, and pagination. Introducing PrimeVue will improve the user experience with a more feature-rich coffee list view and provide a foundation for future UI enhancements.

## What Changes

- Add `primevue` as a new dependency to the frontend project
- Initialize and configure PrimeVue with the existing Tailwind CSS setup
- Replace the existing coffee list table with a PrimeVue DataTable component
- The DataTable will provide: sorting, filtering, pagination, column toggles, and improved responsive design
- Configure at least one additional PrimeVue component (e.g., Badge for ratings, Button for actions)

## Capabilities

### New Capabilities
- `ui-component-library-integration`: Integrate PrimeVue component library into the Vue 3 frontend, and apply the DataTable component to the coffee list view.

### Modified Capabilities
- (None - this is a new addition, not modifying existing capability requirements)

## Impact

- **Frontend dependencies**: New npm dependency added (primevue + primeicons)
- **Frontend components**: The coffee overview page component will be updated to use the new DataTable
- **Styling**: PrimeVue themes work with existing Tailwind CSS - must apply the design tokens from `frontend/docs/DESIGN.md` (CSS custom properties like `--color-cream`, `--color-amber`, `--color-espresso`, etc.) to ensure visual consistency with the existing design system
- **No breaking changes**: The GraphQL API remains unchanged; this is purely a frontend UI improvement