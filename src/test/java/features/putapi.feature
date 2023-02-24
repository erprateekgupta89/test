Feature: PUT API to update user details 

  Background: 
    * url 'https://reqres.in/'
    * def requestPayload =
      """
      {
            "first_name": "LindsayTest",
            "last_name": "FergusonTest",
      }
      """
  

  @tag7
  Scenario: update user name
    Given path 'api/users/8'
    And request requestPayload
    When method PUT
    Then status 200
    And print response
    And match $.first_name == '#present'
    And match $.last_name == '#present'
    And match $.last_name == 'FergusonTest'
   