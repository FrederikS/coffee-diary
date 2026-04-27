## 1. Setup Dependencies

- [x] 1.1 Add SmallRye GraphQL dependency to pom.xml
- [x] 1.2 Add PostgreSQL JDBC driver dependency
- [x] 1.3 Add Panache dependency (with Hibernate ORM)

## 2. Configure Database

- [x] 2.1 Configure datasource in application.properties
- [x] 2.2 Set connection details (host, port, user, password, db)

## 3. Create Roastery Package Structure

- [x] 3.1 Create `codes.fdk.coffeediary.roastery` package
- [x] 3.2 Create Roastery.java entity
- [x] 3.3 Create RoasteryRepository.java (Panache repository pattern)
- [x] 3.4 Create RoasteryService.java
- [x] 3.5 Create RoasteryResource.java (GraphQL queries)

## 4. Configure GraphQL

- [x] 4.1 Verify /graphql endpoint configuration
- [x] 4.2 Add root query class if needed

## 5. Frontend - Roastery Detail Page

- [x] 5.1 Create roastery GraphQL query (fetch roastery by id)
- [x] 5.2 Add Vue Router route `/roastery/:id`
- [x] 5.3 Create store/state management for roastery data
- [x] 5.4 Create RoasteryDetails.vue page component
- [x] 5.5 Display roastery name and website
- [x] 5.6 Add Vitest unit tests for RoasteryDetails component

## 6. Tests Setup

- [x] 6.1 Add Dev Services dependency
- [x] 6.2 Configure Quarkus Dev Services for PostgreSQL in integration tests
- [x] 6.3 Create GraphQL API integration tests

## 7. Verify

- [x] 7.1 Build both backend and frontend
- [x] 7.2 Run integration tests (GraphQL API)
- [x] 7.3 Run Vitest unit tests (frontend)
- [x] 7.4 All tests MUST pass (backend + frontend)