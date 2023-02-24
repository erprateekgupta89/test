Feature: Post API with headers & Authorization

  Background: 
    * url baseURL
    * def random_String =
      """
      function(s){
      var text ='';
      var pattern='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      for (var i=0 ; i<s; i++)
      text+= pattern.charAt(Math.floor(Math.random()* pattern.length()));
      return text;
      }
      """
    * def randomString = random_String(10)
    * print randomString
    * def requestPayload =  read('classpath:payload/user.json')
    * requestPayload.email= randomString +'@mailinator.com'

  @tag6
  Scenario: Create user by passing headers with auth token & generating random email
    * def req_headers = {Content-Type:'application/json',Accept-Encoding:'gzip, deflate, br'}
    Given header Authorization = 'Bearer '+tokenID
    And headers req_headers
    And path '/public/v2/users'
    And request requestPayload
    When method POST
    Then status 201
    And print response
    And match $.id == '#present'
    And match $.name == 'Testt21patrick'
