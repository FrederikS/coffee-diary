# roastery-entity Specification

## Purpose
First feature implementation for coffee-diary. Roastery is the parent entity for coffee in the data model, making it a logical starting point to expose via the GraphQL API. The UI needs roastery data to display before introducing the coffee entity.

## Requirements
### Requirement: Roastery entity representation
The system SHALL represent a roastery as an entity with id, name, and website fields.

#### Scenario: Roastery has correct fields
- **WHEN** roastery is loaded from database
- **THEN** it has id (bigint), name (text), website (text) fields

### Requirement: Repository pattern implementation
The system SHALL use a repository class for data access, not active record.

#### Scenario: Repository is separate from entity
- **WHEN** RoasteryRepository is instantiated
- **THEN** it extends PanacheRepository and is separate from Roastery entity

