Feature: browser automation 6

  @tag9
  Scenario: try to click at ok at simple dialog pop up
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_alert'
    # Switch with locator
    And switchFrame("//iframe[@name='iframeResult']")
    # Switch with Index
    #And switchFrame(2)
    And click("//button[normalize-space()='Try it']")
    * dialog(true)

  @tag10
  Scenario: try to click at ok at Confirm Box dialog pop up
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_confirm'
    # Switch with locator
    And switchFrame("//iframe[@name='iframeResult']")
    # Switch with Index
    #And switchFrame(2)
    And click("//button[normalize-space()='Try it']")
    * dialog(true, 'You pressed OK!')

  @tag11
  Scenario: try to click at ok at Prompt Box dialog pop up
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.w3schools.com/js/tryit.asp?filename=tryjs_prompt'
    # Switch with locator
    And switchFrame("//iframe[@name='iframeResult']")
    # Switch with Index
    #And switchFrame(2)
    And click("//button[normalize-space()='Try it']")
    * dialog(true, 'User test')
