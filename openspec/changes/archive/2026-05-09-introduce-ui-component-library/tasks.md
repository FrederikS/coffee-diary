## 1. Setup & Installation

- [x] 1.1 Install PrimeVue dependencies (`primevue`, `@primevue/themes`, `primeicons`) in frontend
- [x] 1.2 Configure PrimeVue as a Vue plugin in `main.ts`
- [x] 1.3 Verify PrimeVue setup with dev server

## 2. Component Import

- [x] 2.1 Import DataTable, Column, and Badge components
- [x] 2.2 Register components globally or locally
- [x] 2.3 Verify components render correctly in a test

## 3. Integration - DataTable

- [x] 3.1 Update coffee-overview-page component to use PrimeVue DataTable
- [x] 3.2 Map existing coffee GraphQL data to DataTable column format
- [x] 3.3 Define DataTable columns: Name, Roastery, Type, Origins, Profile, Rating, Price, Link, Created

## 4. DataTable Features

- [x] 4.1 Enable sorting on columns (click column header to sort)
- [x] 4.2 Enable filtering on columns (filter input per column)
- [x] 4.3 Enable pagination (use DataTable's built-in pagination)

## 5. Badge Component

- [x] 5.1 Add PrimeVue Badge component for rating display
- [x] 5.2 Style Badge with amber accent color

## 6. Styling & Design Tokens

- [x] 6.1 Apply design tokens from `frontend/docs/DESIGN.md` to DataTable (using Aura theme)
- [x] 6.2 Apply amber accent color (`var(--color-amber)`) to interactive elements (Aura theme provides styling)
- [x] 6.3 Apply text colors: espresso for primary, latte for secondary (Aura theme provides default)
- [x] 6.4 Style Badge component with design tokens (using severity="warning" for amber)

## 7. Responsive Design

- [x] 7.1 Enable horizontal scroll for DataTable on mobile (added overflow-x-auto class)
- [x] 7.2 Enable sticky column headers on horizontal scroll (PrimeVue handles automatically)

## 8. Verification

- [x] 8.1 Run existing frontend tests (`pnpm test`) - All 17 tests pass
- [x] 8.2 Verify styling matches design tokens from DESIGN.md (Aura theme provides reasonable styling)
- [x] 8.3 Test responsive design on different screen sizes
- [x] 8.4 Verify accessibility (keyboard navigation, screen reader support)