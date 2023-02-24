Feature: browser automation 7

  @tag12
  Scenario: try to take screenshot
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_prompt'
    # Switch with locator
    And switchFrame("//iframe[@name='iframeResult']")
    # Switch with Index
    #And switchFrame(2)
    And click("//button[normalize-space()='Try it']")
    * dialog(true, 'User test')
    * screenshot()
    * def bytes = screenshot()
    # save the file to target folder with the provided name
    * def file = karate.write(bytes, 'test1.png')
