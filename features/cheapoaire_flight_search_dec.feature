Feature: Cheapoair Flight search functionality

  Scenario:verify user is able to search for the available flights for a future dates
    Given user is on the Cheapoair homepage
    When user selects the Flights tab Trip
    And user search the "Columbus" city and selects "CMH" airport for departure
    And user search for "Cleveland" city and selects "CLE" airport for arrival
    And user selects future dates for departure 10 days from today
    And user selects future dates for arrival 15 days from today
    And user searches for available for flights
    Then verify user should see the available flights results

  Scenario Outline: verify user is able to search for the available flights for different destinations
    Given user is on the Cheapoair homepage
    When user selects the Flights tab Trip
    And user search for <dep_airport> city and selects <dep_airport_code> airport for departure
    And user search for <arr_airport> city and selects <arr_airport_code> airport for arrival
#    And user choose future dates for the arrival <no_of_days> and departure<no_of_days> dates
    And user selects future dates for departure <no_of_days> days from today
    And user selects future dates for arrival <no_of_days> days from today
    And user searches for available for flights
    Then verify user should see the available flights results
    Examples:
      | dep_airport | dep_airport_code | arr_airport | arr_airport_code | no_of_days | no_of_days |
      | Milwaukee   | MKE              | Los Angeles | LAX              | 10         | 15         |
      | Atlanta     | ATL              | Columbus    | CMH              | 11         | 16         |

  Scenario: verify user is able to validate the mandatory search fields for flight search
    Given user is on the Cheapoair homepage
    When user selects the Flights tab Trip
#    And user search for <dep_airport> city and selects <dep_airport_code> airport for departure
#    And user search for <arr_airport> city and selects <arr_airport_code> airport for arrival
#    I dont want to give anything in the fileds, but the clearing the edit box method is somewhere else, so, how should I define a line for that and that.
    And user selects nothing in departure field and arrival field
#      | no_of_days |
#      | 10         |
    And user selects future dates for departure 5 days from today
    And user selects future dates for arrival 15 days from today
    And user searches for available for flights
    Then user should see the please select the flight following error message

  Scenario: verify user is able to validate the mandatory search fields for flight search without selecting the dates
    Given user is on the Cheapoair homepage
    When user selects the Flights tab Trip
#    And user search for <dep_airport> city and selects <dep_airport_code> airport for departure
#    And user search for <arr_airport> city and selects <arr_airport_code> airport for arrival
#    I dont want to give anything in the fileds, but the clearing the edit box method is somewhere else, so, how should I define a line for that and that.
    And user selects nothing in departure field and arrival field

    And user searches for available for flights
    Then user should see the following error message
#CHECKING IF THIS  IS ADDED