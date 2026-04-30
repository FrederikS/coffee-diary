package codes.fdk.coffeediary.coffee;

import io.quarkus.test.junit.QuarkusIntegrationTest;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.hasItems;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;

@QuarkusIntegrationTest
class CoffeeResourceIT {

    @Test
    void getCoffees_returnsAllCoffees() {
        var body = """
            {
                "query": "query { coffees { id name arabica robusta profileDescription price link createdAt } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees.size()", is(5))
            .body("data.coffees[0].name", is("House Blend"));
    }

    @Test
    void getCoffees_returnsEmptyList() {
        var body = """
            {
                "query": "query { coffees { id name } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees", is(not(nullValue())));
    }

    @Test
    void getCoffees_returnsRoasteryAndTypeRelations() {
        var body = """
            {
                "query": "query { coffees { id name roastery { id name } type { id value } } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees[0].roastery.name", is("Backyard Coffee"))
            .body("data.coffees[0].type.value", is("espresso"));
    }

    @Test
    void getCoffees_returnsOriginCountries() {
        var body = """
            {
                "query": "query { coffees { id name countries { id name } } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees[0].countries.size()", is(1))
            .body("data.coffees[0].countries[0].name", is("Ethiopia"));
    }

    @Test
    void getCoffees_returnsProfileTags() {
        var body = """
            {
                "query": "query { coffees { id name profileTags { id value } } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees[0].profileTags.size()", is(2))
            .body("data.coffees[0].profileTags.value", hasItems("Chocolate", "Nutty"));
    }

    @Test
    void getCoffees_returnsImages() {
        var body = """
            {
                "query": "query { coffees { id name images { id sourceUrl } } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees[0].images.size()", is(1))
            .body("data.coffees[0].images[0].sourceUrl", not(nullValue()));
    }

    @Test
    void getCoffees_returnsRatingsWithDrinkType() {
        var body = """
            {
                "query": "query { coffees { id name ratings { id rating drinkType { id value } } } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.coffees[0].ratings.size()", is(1))
            .body("data.coffees[0].ratings[0].rating", is(8))
            .body("data.coffees[0].ratings[0].drinkType.value", is("Espresso"));
    }
}
