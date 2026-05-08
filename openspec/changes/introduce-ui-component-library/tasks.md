## 1. Setup & Installation

- [ ] 1.1 Install PrimeVue dependencies (`primevue`, `@primevue/themes`, `primeicons`) in frontend
- [ ] 1.2 Configure PrimeVue as a Vue plugin in `main.ts`
- [ ] 1.3 Verify PrimeVue setup with dev server

## 2. Component Import

- [ ] 2.1 Import DataTable, Column, and Badge components
- [ ] 2.2 Register components globally or locally
- [ ] 2.3 Verify components render correctly in a test

## 3. Integration - DataTable

- [ ] 3.1 Update coffee-overview-page component to use PrimeVue DataTable
- [ ] 3.2 Map existing coffee GraphQL data to DataTable column format
- [ ] 3.3 Define DataTable columns: Name, Roastery, Type, Origins, Profile, Rating, Price, Link, Created

## 4. DataTable Features

- [ ] 4.1 Enable sorting on columns (click column header to sort)
- [ ] 4.2 Enable filtering on columns (filter input per column)
- [ ] 4.3 Enable pagination (use DataTable's built-in pagination)
- [ ] 4.4 Add column toggle menu (show/hide columns)

## 5. Badge Component

- [ ] 5.1 Add PrimeVue Badge component for rating display
- [ ] 5.2 Style Badge with amber accent color

## 6. Styling & Design Tokens

- [ ] 6.1 Apply design tokens from `frontend/docs/DESIGN.md` to DataTable (cream background: `var(--color-cream)`)
- [ ] 6.2 Apply amber accent color (`var(--color-amber)`) to interactive elements (sort, filter, pagination)
- [ ] 6.3 Apply text colors: espresso for primary, latte for secondary
- [ ] 6.4 Style Badge component with design tokens

## 7. Responsive Design

- [ ] 7.1 Enable horizontal scroll for DataTable on mobile
- [ ] 7.2 Enable sticky column headers on horizontal scroll

## 8. Verification

- [ ] 8.1 Run existing frontend tests (`pnpm test`)
- [ ] 8.2 Verify styling matches design tokens from DESIGN.md
- [ ] 8.3 Test responsive design on different screen sizes
- [ ] 8.4 Verify accessibility (keyboard navigation, screen reader support)