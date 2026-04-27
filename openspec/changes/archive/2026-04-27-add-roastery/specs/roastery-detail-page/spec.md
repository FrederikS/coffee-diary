## ADDED Requirements

This spec follows the design guidelines defined in `frontend/docs/DESIGN.md`. All colors,
typography, spacing, and component styles must use tokens defined there — never raw values.

### Requirement: Roastery detail page displays roastery name
The page SHALL display the roastery's name.

#### Scenario: Display roastery name
- **WHEN** user visits `/roastery/1`
- **THEN** page displays the roastery's name

### Requirement: Roastery detail page displays roastery website
The page SHALL display the roastery's website as a clickable link.

#### Scenario: Display roastery website
- **WHEN** user visits `/roastery/1`
- **THEN** page displays the roastery's website as a link that opens in a new tab

### Requirement: Roastery detail page shows loading state
The page SHALL show a loading state while fetching roastery data.

#### Scenario: Loading state displayed
- **WHEN** page is loading
- **THEN** a loading indicator is displayed

### Requirement: Roastery detail page handles missing roastery
The page SHALL handle the case when a roastery is not found (API returns null).

#### Scenario: Roastery not found
- **WHEN** roastery with given ID does not exist
- **THEN** page shows "Roastery not found" message

### Requirement: Unit tests for RoasteryDetails component
The component SHALL have unit tests using Vitest and Vue Test Utils.

#### Scenario: Unit test for displaying roastery name
- **WHEN** unit tests run
- **THEN** tests verify the component displays the roastery name correctly

#### Scenario: Unit test for displaying roastery website
- **WHEN** unit tests run
- **THEN** tests verify the component displays the website link correctly

#### Scenario: Unit test for loading state
- **WHEN** unit tests run
- **THEN** tests verify the loading state is displayed while loading