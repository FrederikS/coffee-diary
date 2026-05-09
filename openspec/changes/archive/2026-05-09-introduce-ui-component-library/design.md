## Context

The coffee diary frontend is a Vue 3 + TypeScript application with Vite as the build tool and Tailwind CSS for styling. The current coffee overview page displays coffees in a basic HTML table that lacks modern UI patterns like sorting, filtering, column visibility, and responsive design.

The goal is to introduce PrimeVue, a mature Vue 3 component library with a comprehensive set of UI components. This will provide feature-rich components that integrate well with the existing tech stack.

**Constraints:**
- Must work with existing Tailwind CSS v3.4.19 setup
- Must be compatible with Vue 3.5.32 and TypeScript
- No changes to the GraphQL API (read-only frontend)
- Should minimize breaking changes to existing components
- PrimeVue components MUST use design tokens from `frontend/docs/DESIGN.md` (CSS custom properties: `--color-cream`, `--color-amber`, `--color-espresso`, `--color-latte`, `--color-oat`, `--color-slate`, `--color-surface`)

## Goals / Non-Goals

**Goals:**
- Integrate PrimeVue component library into the frontend project
- Configure PrimeVue with Vue plugin and component registry
- Replace the existing coffee list table with a PrimeVue DataTable component
- Add sorting, filtering, pagination, and column toggles to the coffee list
- Add at least one additional PrimeVue component (Badge for ratings display)
- Ensure responsive design works on mobile and desktop
- Style PrimeVue components to match the design tokens from `frontend/docs/DESIGN.md` (use CSS custom properties like `var(--color-cream)` for backgrounds, `var(--color-amber)` for accents, etc.)

**Non-Goals:**
- Migrating all existing components to PrimeVue at once
- Adding backend functionality or modifying the GraphQL API
- Implementing full-text search or advanced filtering in this change
- Adding authentication or user management features

## Decisions

### 1. Component Library: PrimeVue over alternatives
**Chosen:** PrimeVue

**Alternatives considered:**
- shadcn-vue: Built on Radix UI, good Tailwind integration, but newer and less mature
- Vuetify: Full-featured but opinionated, harder to customize, heavier
- Naive UI: Good but less comprehensive component coverage

**Rationale:** PrimeVue is a mature, well-established Vue 3 component library with excellent documentation. It provides a comprehensive DataTable with built-in sorting, filtering, pagination, and column toggling out of the box. While it's heavier than some alternatives, the feature completeness and stability make it a better fit for a long-term project like coffee-diary.

### 2. Integration Approach: Vue plugin with unstyled mode
**Chosen:** Use PrimeVue as a Vue plugin with unstyled mode, applying Tailwind classes directly

**Rationale:** PrimeVue's unstyled mode allows us to use our own Tailwind classes while getting the functionality we need. This gives us full control over styling to match the existing design system.

### 3. Initial Components: DataTable + Badge
**Chosen:** DataTable for coffee list, Badge for rating display

**Rationale:** 
- DataTable directly replaces the existing table and adds missing functionality (sorting, filtering, pagination, column toggles)
- Badge is a simple component that demonstrates integration without complex logic
- These provide immediate user value without over-complicating the initial implementation

### 4. DataTable Data Handling: Use existing query structure
**Chosen:** Pass existing GraphQL query data directly to DataTable

**Rationale:** The current coffee overview already fetches data via GraphQL. We'll adapt the existing data shape to work with PrimeVue's column definition format rather than changing the API layer.

## Risks / Trade-offs

- **[Risk] Styling overrides:** PrimeVue default styles may not match our design tokens
  - → **Mitigation:** Use PrimeVue's passthrough mode to apply Tailwind classes using the exact CSS custom properties from `frontend/docs/DESIGN.md` (`--color-cream`, `--color-amber`, `--color-espresso`, etc.)

- **[Risk] Bundle size:** PrimeVue is larger than some alternatives
  - → **Mitigation:** Import only the components needed (DataTable, Badge), tree-shake unused code

- **[Risk] Learning curve:** Team unfamiliar with PrimeVue's API
  - → **Mitigation:** Document component usage, use well-documented components (DataTable)

- **[Trade-off] Additional dependency:** More packages to maintain vs. improved UX
  - **Conclusion:** The improved user experience and feature completeness justify the maintenance overhead for a mature, well-maintained library

## Migration Plan

1. **Installation Phase:**
   - Install `primevue` and `@primevue/themes` (or `primeicons`)
   - Configure PrimeVue as a Vue plugin in `main.ts`
   - Verify setup with dev server

2. **Component Import Phase:**
   - Import DataTable, Column, Badge components
   - Register components locally or globally
   - Verify components render correctly

3. **Integration Phase:**
   - Update coffee-overview-page component to use DataTable
   - Map existing coffee data to DataTable column format
   - Add sorting, filtering, pagination functionality
   - Add Badge component for rating display
   - Apply Tailwind classes to match design system

4. **Verification Phase:**
   - Run existing tests to ensure no regressions
   - Verify responsive design on different screen sizes
   - Check accessibility (keyboard navigation, screen reader)
   - Verify styling uses the exact design tokens from `frontend/docs/DESIGN.md` (cream background: `var(--color-cream)`, amber accents: `var(--color-amber)`)

## Open Questions

1. Which PrimeVue theme to use?
   - Decision: Use the unstyled mode with Tailwind passthrough to fully control styling and match our design system

2. How to handle the existing table's custom styling (e.g., row hover effects)?
   - Decision: Use Tailwind utilities via PrimeVue's `pt` (passthrough) option to replicate the look

3. Should we add pagination or use DataTable's built-in pagination?
   - Decision: Use DataTable's built-in pagination to start, customize with our own Tailwind classes