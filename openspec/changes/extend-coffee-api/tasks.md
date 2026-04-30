## 1. Backend — Rename and Entity

- [ ] 1.1 Rename `CoffeeResolver.java` → `CoffeeResource.java` in `backend/src/main/java/codes/fdk/coffeediary/coffee/`
- [ ] 1.2 Update class name and constructor reference in the renamed file

## 2. Backend — Add JPA Relationships to Coffee Entity

- [ ] 2.1 Add `@ManyToOne` for `roastery` (FK → roastery)
- [ ] 2.2 Add `@ManyToOne` for `type` (FK → coffee_type)
- [ ] 2.3 Add `@OneToMany` with `@JoinTable` for `countries` (via coffee_country)
- [ ] 2.4 Add `@OneToMany` with `@JoinTable` for `profileTags` (via coffee_profile_tag)
- [ ] 2.5 Add `@OneToMany` with `@JoinTable` for `images` (via coffee_image)
- [ ] 2.6 Add `@OneToMany` for `ratings` (via coffee_rating)
- [ ] 2.7 Add getter/setter methods for all new relation fields

## 3. Backend — Repository Fetch Joins

- [ ] 3.1 Update `CoffeeRepository.findAllCoffees()` with JPQL JOIN FETCH for roastery and type
- [ ] 3.2 Optional: Add separate query methods if different relation sets needed for list vs detail

## 4. Frontend — Update Coffee List Table

- [ ] 4.1 Update GraphQL query to fetch new coffee fields (roastery, type, countries, profileTags, images, ratings)
- [ ] 4.2 Add column for Roastery name
- [ ] 4.3 Add column for Coffee type (espresso, filter, omni-roast)
- [ ] 4.4 Add column for Origins (comma-separated country names)
- [ ] 4.5 Add column for Profile Tags (comma-separated tag values)
- [ ] 4.6 Add column for Average Rating (computed from ratings array)
- [ ] 4.7 Retain existing columns: Name, Price, Link, Created

## 5. Backend — Integration Tests

- [ ] 5.1 Update `CoffeeResolverIT.java` → `CoffeeResourceIT.java` integration test class
- [ ] 5.2 Add test scenario: Coffees query returns roastery and type relations
- [ ] 5.3 Add test scenario: Coffees query returns origin countries
- [ ] 5.4 Add test scenario: Coffees query returns profile tags
- [ ] 5.5 Add test scenario: Coffees query returns images
- [ ] 5.6 Add test scenario: Coffees query returns ratings with drink type
- [ ] 5.7 Verify test data in `backend/src/test/resources/db/init.sql` includes relations (roastery, countries, tags, etc.)

## 6. Frontend — Unit/Component Tests

- [ ] 6.1 Add Vitest test for CoffeeTable component rendering all columns
- [ ] 6.2 Add test for comma-separated country list formatting
- [ ] 6.3 Add test for comma-separated profile tags formatting
- [ ] 6.4 Add test for average rating computation
- [ ] 6.5 Add test for nested roastery name display
- [ ] 6.6 Add test for nested type value display

## 7. Testing — N+1 Verification

- [ ] 7.1 Verify no N+1 queries by enabling query logging or DB query count in tests