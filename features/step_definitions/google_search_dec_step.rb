Given(/^user is on the google homepage$/) do
  visit GoogleHomePage
end

And(/^user searches for the "([^"]*)"$/) do |searching_for|
  on(GoogleHomePage).search_criteria_element.set searching_for
  # on(GoogleHomePage).clicking_on_search_element.send_keys :enter
  on(GoogleHomePage).clicking_on_search_element.set :enter
end

Then(/^verify user should see the available search details$/) do
  on(GoogleHomePage).get_search_results
end

And(/^user searches for the (.*)$/) do |search_criteria|
  on(GoogleHomePage).search_google_for search_criteria
end