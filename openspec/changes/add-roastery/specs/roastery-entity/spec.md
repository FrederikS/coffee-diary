## ADDED Requirements

### Requirement: Roastery entity representation
The system SHALL represent a roastery as an entity with id, name, and website fields.

#### Scenario: Roastery has correct fields
- **WHEN** roastery is loaded from database
- **THEN** it has id (bigint), name (text), website (text) fields

### Requirement: Roastery is an aggregate root
The Roastery entity SHALL be marked as an aggregate root using jMolecules annotations.

#### Scenario: Entity has aggregate root annotation
- **WHEN** Roastery.java is examined
- **THEN** it has @AggregateRoot annotation

### Requirement: Repository pattern implementation
The system SHALL use a repository class for data access, not active record.

#### Scenario: Repository is separate from entity
- **WHEN** RoasteryRepository is instantiated
- **THEN** it extends PanacheRepository and is separate from Roastery entity