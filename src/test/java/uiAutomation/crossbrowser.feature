Feature: browser automation 2

  Background: 

  @tag2
  Scenario: try to login to saucedemo using chrome
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    * clear("//*[@id='user-name']")
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    And click("//*[@id='login-button']")
    When waitForUrl('https://www.saucedemo.com/inventory.html')
    And match driver.title =='Swag Labs'
    Then match driver.url == "https://www.saucedemo.com/inventory.html"
    Then click("//*[@id='react-burger-menu-btn']")
    # Simple click at logout button
    #Then click("//*[@id='logout_sidebar_link']")
    * mouse().move("//*[@id='logout_sidebar_link']").submit().click();

  @tag3
  Scenario: try to login to saucedemo using Msedge
    # configure for specific msedge  from default location
    * configure driver = { type: 'msedge', showDriverLog: true }
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    When click("//*[@id='login-button']")
    Then waitForUrl('https://www.saucedemo.com/inventory.html')
    And match driver.title =='Swag Labs'

  @tag4
  Scenario: try to login to saucedemo using Firefox
    # configure for specific geckodriver location
    * configure driver = { type: 'geckodriver', executable:'C:\\browserdrivers\\geckodriver.exe'}
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    When click("//*[@id='login-button']")
    Then waitForUrl('https://www.saucedemo.com/inventory.html')
    And match driver.title =='Swag Labs'
