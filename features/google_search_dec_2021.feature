Feature: Google Search functionality

  Scenario: verify user is able to search for the available laptop details
    Given user is on the google homepage
    And user searches for the Dell laptops
       Then verify user should see the available search details


  Scenario Outline: verify user is able to search for the available different laptop details
    Given user is on the google homepage
    And user searches for the <laptop_details>
        Then verify user should see the available search details

    Examples:
      | laptop_details |
      | Dell laptops   |
      | Sony laptops   |
      | HP laptops     |

#    inline table
  Scenario: verify user is able to search for the available different laptop details using inline table
    Given user is on the google homepage
    And user searches for the <laptop_details>
      | laptop_details |
      | Dell laptops   |
      | Sony laptops   |
      | HP laptops     |
    Then verify user should see the available search details


#    Declarative style (giving brief details)
  Scenario: verify user is able to search for the available laptop details in declarative style
    Given user is on the google homepage
    When user searches for the "Dell laptops"
    Then verify user should see the available search details

    #    negative case
  Scenario: verify user is able to validate ALL the mandatory search fields for Google
    Given user is on the google homepage
    When user selects search bar
    And user searches for the available search results
    Then user should see the following error messages:
      | error message |
      | error message |
      | error message |
