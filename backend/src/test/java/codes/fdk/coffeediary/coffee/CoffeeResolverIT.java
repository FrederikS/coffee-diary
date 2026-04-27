package codes.fdk.coffeediary.coffee;

import io.quarkus.test.junit.QuarkusIntegrationTest;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.nullValue;

@QuarkusIntegrationTest
class CoffeeResolverIT {

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
}