Feature: Delete API to update user details 

  Background: 
    * url 'https://reqres.in/'
 
  

  @tag8
  Scenario: Delete user 
    Given path 'api/users/8'
    When method DELETE
    Then status 204
    And print response
    
 