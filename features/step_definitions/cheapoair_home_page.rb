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

And(/^user search for "([^"]*)" city and selects "([^"]*)" airport for arrival$/) do |arr_airport, arr_airport_code|
  on(CheapoairHomePage).search_arr_airport arr_airport, arr_airport_code
end

And(/^user selects future dates for departure (\d+) days from today$/) do |no_of_days|
  on(CheapoairHomePage).choose_dep_date no_of_days
  sleep 2
  # on(CheapoairHomePage).choose_dep_date 5

end

And(/^user selects future dates for arrival (\d+) days from today$/) do |no_of_days|
  on(CheapoairHomePage).choose_arr_date no_of_days
  # on(CheapoairHomePage).choose_dep_date 10

end

And(/^user searches for available for flights$/) do
  on(CheapoairHomePage).search_flights
end

Then(/^verify user should see the available flights results$/) do
  on(CheapoairFlightSearchResultsPage).actual_flight_results
end

And(/^user search for (.*) city and selects (.*) airport for departure$/) do |dep_airport, dep_airport_code|
  on(CheapoairHomePage).search_dep_airport dep_airport, dep_airport_code
end

And(/^user search for (.*) city and selects (.*) airport for arrival$/) do |arr_airport, arr_airport_code|
  on(CheapoairHomePage).search_arr_airport arr_airport, arr_airport_code
end

# And(/^user choose future dates for the arrival (.*) and departure(.*) dates$/) do |no_of_days1, no_of_days2|
#   on(CheapoairHomePage).choose_dep_date (no_of_days)
#   on(CheapoairHomePage).choose_arr_date (no_of_days)
# when you have both mentioned in one line, how to do this?
# end

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