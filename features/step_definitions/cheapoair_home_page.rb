Given(/^user is on the Cheapoair homepage$/) do
  visit CheapoairHomePage
end

When(/^user selects the Flights tab Trip$/) do
  on(CheapoairHomePage).selecting_flight_tab_element.click
  sleep 2
end

And(/^user search the "([^"]*)" city and selects "([^"]*)" airport for departure$/) do |dep_airport, dep_airport_code|
  on(CheapoairHomePage).search_dep_airport dep_airport, dep_airport_code
end

# And(/^user search for "([^"]*)" city and selects "([^"]*)" airport for arrival$/) do |arr_airport, arr_airport_code|
#   on(CheapoairHomePage).search_arr_airport arr_airport, arr_airport_code
# end

And(/^user selects future dates for departure (\d+) days from today$/) do |no_of_dep_days|
  on(CheapoairHomePage).choose_dep_date no_of_dep_days
  sleep 2
  # on(CheapoairHomePage).choose_dep_date 5

end

And(/^user selects future dates for arrival (\d+) days from today$/) do |no_of_arr_days|
  on(CheapoairHomePage).choose_arr_date no_of_arr_days
  # on(CheapoairHomePage).choose_dep_date 10

end

And(/^user searches for available for flights$/) do
  on(CheapoairHomePage).search_flights
end

Then(/^verify user should see the available flights results$/) do
  p on(CheapoairFlightSearchResultsPage).actual_flight_results
  expect(on(CheapoairFlightSearchResultsPage).actual_flight_results).to be > 1
  # whether it is true or false no difference in out put?
end

And(/^user search for (.*) city and selects (.*) airport for departure$/) do |dep_airport, dep_airport_code|
  on(CheapoairHomePage).search_dep_airport dep_airport, dep_airport_code
end
And(/^user search for (.*) city and selects (.*) airport for arrival$/) do |arr_airport, arr_airport_code|
  on(CheapoairHomePage).search_arr_airport arr_airport, arr_airport_code
end

And(/^user selects nothing in departure field and arrival field$/) do
  on(CheapoairHomePage).clearing_dep_field
  on(CheapoairHomePage).clearing_arr_field
end

Then(/^user should see the please select the flight following error message$/) do
  on(CheapoairHomePage).error_message_from_city_to_city
end

Then(/^user should see the following error message$/) do
  on(CheapoairHomePage).error_messages_from_city_to_city_dates
end

When(/^user selects the Hotels tab Trip$/) do
  on(CheapoairHomePage).selecting_hotels
end

And(/^user choose future dates for the departure (.*) and arrival (.*) dates$/) do |no_of_days_dep, no_of_days_arr|
  on(CheapoairHomePage).choose_dep_date no_of_days_dep.to_i
  on(CheapoairHomePage).choose_arr_date no_of_days_arr.to_i
end
#calling Steps from Step Definitions
# When(/^end user searches for the flights for future dates$/) do
#   on(CheapoairHomePage) do |homepage|
#     homepage.selecting_flight_tab_element.click
#     homepage.search_dep_airport "Cleveland", "CLE"
#     homepage.search_arr_airport "Columbus", "CMH"
#     homepage.choose_dep_date 5
#     homepage.choose_arr_date 10
#     homepage.search_flights
#
#   end
#  you can do this way or you can do the following way. You can call the steps by using the keyword step.

When(/^end user searches for the flights for future dates$/) do
  step 'user selects the Flights tab Trip'
  step 'user search the "Columbus" city and selects "CMH" airport for departure'
  step 'user search for "Cleveland" city and selects "CLE" airport for arrival'
  #how to use interpolation for parameters?
  step 'user selects future dates for departure 10 days from today'
  step 'user selects future dates for arrival 15 days from today'
  step 'user searches for available for flights'
  step 'verify user should see the available flights results'
end
# When(/^end user searches for the flights for future dates$/) do
#   steps %Q{
#     When user selects the Flights tab Trip
#     And user search the "Columbus" city and selects "CMH" airport for departure
#     And user search for "Cleveland" city and selects "CLE" airport for arrival
#     And user selects future dates for departure 10 days from today
#     And user selects future dates for arrival 15 days from today
#     And user searches for available for flights
#     Then verify user should see the available flights results
#
#       }
#
# end
# When(/^end user searches for the different flights for future dates$/) do
#   step 'user selects the Flights tab Trip'
#   step 'user search for <dep_airport> city and selects <dep_airport_code> airport for departure'
#   step 'user search for <arr_airport> city and selects <arr_airport_code> airport for arrival'
#   step 'user choose future dates for the departure <no_of_days_dep> and arrival <no_of_days_arr> dates'
#   step 'user searches for available for flights'
#   step 'verify user should see the available flights results'
# end

# When(/^end user searches for the different flights for future dates$/) do
# @data = YAML.load_file 'features/support/test data/cheapoair_flight_test_data.yml'
#
# step 'user selects the Flights tab Trip'
# # step 'user search for @data['dep_airport'] city and selects @data['dep_airport_code'] airport for departure'
# step 'user search for @data["dep_airport"] city and selects @data["dep_airport_code"] airport for departure'
# step 'user search for @data["arr_airport"] city and selects @data["arr_airport_code"] airport for arrival'
# step 'user choose future dates for the departure @data["no_of_days_dep"] and arrival @data["no_of_days_arr"] dates'
# step 'user searches for available for flights'
# step 'verify user should see the available flights results'
#not working even when I am giving in double quotes or single quotes, it says expected :; or end of line??

When(/^end user searches for the different flights for future dates$/) do
  # @data = YAML.load_file '../test data/cheapoair_flight_test_data.yml'
  # @data = YAML.load_file 'support/test data/cheapoair_flight_test_data.yml'
  @data = YAML.load_file 'features/support/test data/cheapoair_flight_test_data.yml'

  on(CheapoairHomePage) do |homepage|
    homepage.selecting_flight_tab_element.click
    homepage.search_dep_airport @data['dep_airport'], @data['dep_airport_code']
    homepage.search_arr_airport @data['arr_airport'], @data['arr_airport_code']
    homepage.choose_dep_date 5
    homepage.choose_arr_date 10
    homepage.search_flights
  end
end