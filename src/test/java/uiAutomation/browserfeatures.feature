Feature: browser automation 1

  @tag1
  Scenario: try to use browser functions   using chrome
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://karatelabs.github.io/karate/karate-core/'
    And driver.dimensions = { x: 0, y: 0, width: 600, height: 800 }
    * def dims = driver.dimensions
    * print dims
    * driver.maximize()
    When click("//*[@id='site-nav']/nav/ul/li[7]/a")
    Then waitForUrl('https://karatelabs.github.io/karate/examples/jobserver/')
    And match driver.title =='Distributed Testing | Karate'
    And match driver.url == "https://karatelabs.github.io/karate/examples/jobserver/"
    # Normal page reload not clear cache
    * driver.refresh()
    * driver.back()
    # Hard page reload will clear cache
    * driver.reload()
    * driver.forward()
    # Normally don't need quit Karate will close the browser automatically after a scenario
   
