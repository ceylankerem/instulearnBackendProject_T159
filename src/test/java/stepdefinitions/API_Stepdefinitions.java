package stepdefinitions;

import config_Requirements.ConfigLoader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.hamcrest.Matchers;
import org.junit.Assert;
import utilities.API_Utilities.API_Methods;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

public class API_Stepdefinitions {

    Response response;
    JsonPath jsonPath;
    String exceptionMesaj;
    ConfigLoader configLoader = new ConfigLoader();

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .when()
                .get(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, equalTo(value));
    }

    @Given("The api user verifies the {string}, {string}, {int}, {int}, {int}, {string} and {string} information of the item at {int} in the response body.")
    public void the_api_user_verifies_the_and_information_of_the_item_at_in_the_response_body(String slug, String icon, int order, Integer int2, Integer int3, String string3, String title, int dataIndex) {
        jsonPath = response.jsonPath();
        Assert.assertEquals(slug, jsonPath.getString("data.categories[" + dataIndex + "].slug"));
        Assert.assertNull(jsonPath.get("data.categories[" + dataIndex + "].parent_id"));
        Assert.assertEquals(order, jsonPath.getInt("data.categories[" + dataIndex + "].order"));
        Assert.assertEquals(title, jsonPath.getString("data.categories[" + dataIndex + "].translations[0].title"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(HooksAPI.spec)
                    .when()
                    .get(API_Methods.fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user verifies the {int}, {string}, {string}, {int}, {int}, {int}, {string} and {string} contents in the response body data.")
    public void the_api_user_verifies_the_and_contents_in_the_response_body_data(int id, String slug, String string2, Integer int2, Integer int3, Integer int4, String string3, String title) {
        response.then()
                .assertThat()
                .body("data.id", equalTo(id),
                        "data.slug", equalTo(slug),
                        "data.parent_id", nullValue(),
                        "data.translations[0].title", equalTo(title));
    }
}