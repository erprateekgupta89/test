Feature: browser automation 8

  @tag13
  Scenario: try to scroll and highlight to element  using chrome
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://karatelabs.github.io/karate/karate-core/'
    And driver.dimensions = { x: 0, y: 0, width: 600, height: 800 }
    * def dims = driver.dimensions
    * print dims
    * scroll("//p[307]//a[1]//code[1]")
    # method use to highlight the element
    * highlight("//p[307]//a[1]//code[1]")
    # method to perform scroll to element and perform action over it
    * scroll("//p[307]//a[1]//code[1]").click
    * driver.maximize()

  @tag14
  Scenario: try to move the mouse and highlight to element  using chrome
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    And click("//*[@id='login-button']")
    When waitForUrl('https://www.saucedemo.com/inventory.html')
    And match driver.title =='Swag Labs'
    And match driver.url == "https://www.saucedemo.com/inventory.html"
    * mouse().move("//*[@id='react-burger-menu-btn']").go
    * highlight("//*[@id='react-burger-menu-btn']")
    Then click("//*[@id='react-burger-menu-btn']")

  @tag15
  Scenario: try to fetch text and get value and highlight to element  using chrome
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.saucedemo.com/'
    And input("//*[@id='user-name']",'standard_user')
    And input("//*[@id='password']",'secret_sauce')
    And click("//*[@id='login-button']")
    When waitForUrl('https://www.saucedemo.com/inventory.html')
    And match driver.title =='Swag Labs'
    And match driver.url == "https://www.saucedemo.com/inventory.html"
    * mouse().move("//button[@id='add-to-cart-sauce-labs-backpack']")
    * highlight("//button[@id='add-to-cart-sauce-labs-backpack']")
    # to get the text from webelement
    Then match text("//button[@id='add-to-cart-sauce-labs-backpack']") == 'Add to cart'
    # to get the attribute from webelement
    And match attribute("//button[@id='add-to-cart-sauce-labs-backpack']", 'name') == 'add-to-cart-sauce-labs-backpack'
