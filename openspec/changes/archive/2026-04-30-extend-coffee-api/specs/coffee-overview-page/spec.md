# coffee-overview-page Specification

## Purpose

Displays a table of all coffees in the catalogue. This page replaces the current home view.

## Requirements

## MODIFIED Requirements

### Requirement: Coffee table displays all coffees
The page SHALL display all coffees in a table format.

#### Scenario: Coffee table displays data
- **WHEN** user visits `/`
- **THEN** a table is displayed with all coffees

### Requirement: Coffee table shows columns
The table SHALL display the following columns: Name, Roastery, Type, Origins, Profile, Rating, Price, Link, Created.

#### Scenario: Table columns displayed
- **WHEN** user visits `/`
- **THEN** table shows columns for: name, roastery (nested), type (nested), countries (nested, comma-separated), profileTags (nested, comma-separated), averageRating (computed from ratings), price, link, createdAt

#### Scenario: Coffee origins displayed as comma-separated list
- **WHEN** coffee has multiple origin countries
- **THEN** countries are displayed as comma-separated list in table cell

#### Scenario: Coffee profile tags displayed as comma-separated list
- **WHEN** coffee has multiple profile tags
- **THEN** profile tags are displayed as comma-separated list in table cell

#### Scenario: Average rating computed from ratings
- **WHEN** coffee has one or more ratings
- **THEN** the average rating is calculated and displayed in the table

#### Scenario: Coffee type displayed
- **WHEN** coffee has a type (e.g., espresso, filter, omni-roast)
- **THEN** the type value is displayed in the table

#### Scenario: Roastery name displayed
- **WHEN** coffee belongs to a roastery
- **THEN** the roastery name is displayed in the table cell