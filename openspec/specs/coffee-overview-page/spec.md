# coffee-overview-page Specification

## Purpose

Displays a table of all coffees in the catalogue. This page replaces the current home view.

## Requirements
### Requirement: Coffee table replaces home view
The coffee overview table SHALL be the home page at `/`.

#### Scenario: Coffee table is home page
- **WHEN** user visits `/`
- **THEN** the coffee table is displayed

### Requirement: Coffee table displays all coffees
The page SHALL display all coffees in a table format.

#### Scenario: Coffee table displays data
- **WHEN** user visits `/`
- **THEN** a table is displayed with all coffees

### Requirement: Coffee table shows columns
The table SHALL display the following columns: Name, Arabica %, Robusta %, Description, Price, Link, Created.

#### Scenario: Table columns displayed
- **WHEN** user visits `/`
- **THEN** table shows columns for name, arabica, robusta, profileDescription, price, link, createdAt

### Requirement: Coffee table shows loading state
The table SHALL show a loading state while fetching coffee data.

#### Scenario: Loading state displayed
- **WHEN** page is loading
- **THEN** a loading indicator is displayed

### Requirement: Coffee table handles empty list
The table SHALL handle the case when no coffees exist.

#### Scenario: Empty coffee list
- **WHEN** no coffees exist in database
- **THEN** table shows empty state message

### Requirement: Unit tests for CoffeeTable component
The component SHALL have unit tests using Vitest and Vue Test Utils.

#### Scenario: Unit test for table rendering
- **WHEN** unit tests run
- **THEN** tests verify the component renders the table correctly

