# UI Component Library Specification

## Purpose

Integrate PrimeVue component library into the Vue 3 frontend and apply the DataTable component to the coffee list view, while respecting the design tokens defined in `frontend/docs/DESIGN.md`.

## Requirements

### Requirement: PrimeVue is installed and configured
The PrimeVue component library SHALL be installed as a dependency and configured as a Vue plugin.

#### Scenario: PrimeVue dependency is installed
- **WHEN** `npm install primevue @primevue/themes primeicons` is run in the frontend directory
- **THEN** the packages are added to package.json and node_modules

#### Scenario: PrimeVue is configured as Vue plugin
- **WHEN** the frontend application starts
- **THEN** PrimeVue is registered with `app.use(PrimeVue)` and components are available globally

### Requirement: Coffee list displays using PrimeVue DataTable
The coffee list on the overview page SHALL be displayed using a PrimeVue DataTable component.

#### Scenario: Coffee list renders as DataTable
- **WHEN** user navigates to the coffee overview page
- **THEN** a PrimeVue DataTable displays all coffees with columns: Name, Roastery, Type, Origins, Profile, Rating, Price, Link, Created

#### Scenario: Coffee data is passed to DataTable
- **WHEN** coffee data is fetched from GraphQL
- **THEN** the data is passed to the DataTable's v-model or data binding

### Requirement: DataTable supports sorting
The DataTable SHALL allow users to sort by clicking on column headers.

#### Scenario: Single column sort
- **WHEN** user clicks a column header
- **THEN** the data is sorted by that column in ascending order

#### Scenario: Sort direction toggles
- **WHEN** user clicks the same column header again
- **THEN** the sort toggles to descending order

#### Scenario: Sort indicator is displayed
- **WHEN** a column is sorted
- **THEN** a sort indicator (arrow icon) shows the sort direction

### Requirement: DataTable supports filtering
The DataTable SHALL provide filtering capabilities for users to search data.

#### Scenario: Filter input is available
- **WHEN** DataTable is rendered
- **THEN** filter input fields are available for each column

#### Scenario: Filter narrows results
- **WHEN** user enters filter text in a column
- **THEN** only rows matching the filter are displayed

### Requirement: DataTable supports pagination
The DataTable SHALL display paginated results when there are many coffees.

#### Scenario: Pagination controls are displayed
- **WHEN** there are more coffees than the page size
- **THEN** pagination controls show current page, total pages, and navigation buttons

#### Scenario: User navigates between pages
- **WHEN** user clicks next/previous page or a page number
- **THEN** the displayed data updates to show the selected page

### Requirement: PrimeVue components use design tokens
PrimeVue components SHALL use the design tokens from `frontend/docs/DESIGN.md`.

#### Scenario: DataTable uses cream background
- **WHEN** DataTable is rendered
- **THEN** the background color uses `var(--color-cream)` or equivalent Tailwind class

#### Scenario: DataTable uses amber accent for interactive elements
- **WHEN** user interacts with sort, filter, or pagination controls
- **THEN** the accent color uses `var(--color-amber)` or equivalent Tailwind class

#### Scenario: Text colors match design system
- **WHEN** DataTable displays text content
- **THEN** primary text uses `--color-espresso`, secondary text uses `--color-latte`

### Requirement: Rating is displayed using stars
The coffee rating SHALL be displayed using a PrimeVue Rating component (stars).

#### Scenario: Rating shows as stars
- **WHEN** a coffee has a rating value
- **THEN** the rating is displayed as filled/empty stars with amber accent color

#### Scenario: Rating shows numeric value
- **WHEN** a coffee has a rating
- **THEN** the numeric rating value is displayed next to the stars (e.g., "4.0")

### Requirement: Responsive design works on mobile and desktop
The DataTable SHALL adapt to different screen sizes.

#### Scenario: DataTable is scrollable on mobile
- **WHEN** viewing DataTable on a screen narrower than the table width
- **THEN** the table scrolls horizontally

#### Scenario: Column headers remain visible on mobile
- **WHEN** scrolling horizontally on mobile
- **THEN** column headers remain visible (sticky header)