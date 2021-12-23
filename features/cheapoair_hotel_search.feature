Feature: Cheapoaire Hotel functionality
  Scenario:verify user is able to search for the available hotels for a selected dates
    Given user is on the Cheapoair homepage
    When user selects the Hotels tab Trip
    And user search the "Columbus" city and selects "CMH" airport as destination
        And user selects beginning date for stay
    And user selects end date for for stay
    And user selects  <Rooms>, <Adults> and <child> details
    And user searches for the Hotels
