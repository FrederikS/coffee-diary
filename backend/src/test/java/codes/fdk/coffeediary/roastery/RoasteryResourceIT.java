package codes.fdk.coffeediary.roastery;

import io.quarkus.test.junit.QuarkusIntegrationTest;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;

@QuarkusIntegrationTest
class RoasteryResourceIT {

    @Test
    void getRoasteryById_returnsRoastery() {
        var body = """
            {
                "query": "query { roasteryById(id: 1) { id name website } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.roasteryById.name", is("Backyard Coffee"))
            .body("data.roasteryById.website", is("https://www.backyard-coffee.com"));
    }

    @Test
    void getRoasteryById_returnsNullForNotFound() {
        var body = """
            {
                "query": "query { roasteryById(id: 9999) { id name website } }"
            }
            """;

        given()
            .contentType(ContentType.JSON)
            .body(body)
            .when()
            .post("/graphql")
            .then()
            .statusCode(200)
            .body("data.roasteryById", is(nullValue()));
    }
}
