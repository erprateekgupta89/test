Feature: browser automation 3

  @tag5
  Scenario: try to select value from DD
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://www.salesforce.com/in/form/signup/freetrial-sales/?d=topnav2-btn-ft'
    # selecting by value
    And select("//*[@name='UserTitle']", '{}Customer Service Manager')
    # selecting by partial displayed text
    And select("//*[@name='UserTitle']", '{^}General')
    # selecting by  index
    And select("//*[@name='UserTitle']", 8)
