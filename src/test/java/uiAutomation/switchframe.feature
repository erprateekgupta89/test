Feature: browser automation 4

  @tag6
  Scenario: try to switch frame with locators in browser and perform actions
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_iframe'
    # Switch with locator
    And switchFrame("//iframe[@name='iframeResult']")
    * switchFrame("//iframe[@title='W3Schools Free Online Web Tutorials']")
    And click("//*[@id='navbtn_menu']")

  @tag7
  Scenario: try to switch frame with index in browser and perform actions
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_iframe'
    # Switch with Index
    And switchFrame(2)
    * switchFrame(0)
    And click("//*[@id='navbtn_menu']")
