Feature: browser automation 5

  @tag8
  Scenario: try to switch page in browser and perform actions
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    And click("//*[@id='login-button']")
    And click("//a[normalize-space()='Twitter']")
    # switch with url
    And switchPage('twitter.com/saucelabs')
    # switch with browser title
    When switchPage('Swag Labs')
    And match driver.url == "https://www.saucedemo.com/inventory.html"
    And click("//*[@id='react-burger-menu-btn']")
    Then click("//*[@id='logout_sidebar_link']")
    #switch page with index
    And switchPage(1)
