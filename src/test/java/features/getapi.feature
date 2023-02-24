
#GET request with API request with header
Feature: GET API request with header 
Background: 
* url 'https://reqres.in/'

@tag1
  Scenario: GET Call with path 
    * def req_headers = {Content-Type:'application/json; charset=utf-8',Cache-Control:'max-age=0, private, must-revalidate',Accept-Encoding:'gzip, deflate, br', Connection:'keep-alive',Accept:'*/*'}  
   	Given url 'https://reqres.in/'
    Given path 'api/users/2'
    When method GET
    Then status 200
    And print response
    * def jsonResponse = response
    * def first_name = response.data.first_name
    And match first_name == 'Janet'
    And print first_name
    
    @tag2
  Scenario: GET Call with path to check negative case
    * def req_headers = {Content-Type:'application/json; charset=utf-8',Cache-Control:'max-age=0, private, must-revalidate',Accept-Encoding:'gzip, deflate, br', Connection:'keep-alive',Accept:'*/*'}  
   	Given url baseURL+'/public/v2/users'
    Given path '201'
    When method GET
    Then status 404
    And print response
    * def jsonResponse = response
    And match jsonResponse contains {"message": "Resource not found"}
    
@tag3
  Scenario: GET Call with header, Path & Query
    * def req_headers = {Content-Type:'application/json; charset=utf-8',Cache-Control:'max-age=0, private, must-revalidate',Accept-Encoding:'gzip, deflate, br', Connection:'keep-alive',Accept:'*/*'}
    * def query = {"page":"2"}
    
    Given headers req_headers
    And path '/api/users'
    And params query
    When method GET
    Then status 200
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies
@tag4
    #GET request with response using URL 
    Scenario: GET API demo with json object
    * def jsonObject =
    """
    {"page":2,"per_page":6,"total":12,"total_pages":2,"data":[{"id":7,"email":"michael.lawson@reqres.in","first_name":"Michael","last_name":"Lawson","avatar":"https://reqres.in/img/faces/7-image.jpg"},{"id":8,"email":"lindsay.ferguson@reqres.in","first_name":"Lindsay","last_name":"Ferguson","avatar":"https://reqres.in/img/faces/8-image.jpg"},{"id":9,"email":"tobias.funke@reqres.in","first_name":"Tobias","last_name":"Funke","avatar":"https://reqres.in/img/faces/9-image.jpg"},{"id":10,"email":"byron.fields@reqres.in","first_name":"Byron","last_name":"Fields","avatar":"https://reqres.in/img/faces/10-image.jpg"},{"id":11,"email":"george.edwards@reqres.in","first_name":"George","last_name":"Edwards","avatar":"https://reqres.in/img/faces/11-image.jpg"},{"id":12,"email":"rachel.howell@reqres.in","first_name":"Rachel","last_name":"Howell","avatar":"https://reqres.in/img/faces/12-image.jpg"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    """
    
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies
    And print jsonObject.total
    And print jsonObject.data
    And print jsonObject.data[1]
    And print jsonObject.data[1].last_name + " " + "email is "+jsonObject.data[1].email
    And match $.data[1].id == 8
    And assert response.data.length== 6
    
    
    