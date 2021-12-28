And(/^user search the "([^"]*)" city and selects "([^"]*)" airport as destination$/) do |city_name_hotel_search, state_name|
  # on(CheapoairHotelSearch).clearing_hotels_editbox
  on(CheapoairHotelSearch).hotel_search_criteria city_name_hotel_search, state_name
end

And(/^user selects checkin date (.*) days from today$/) do |no_of_days_start|
  on(CheapoairHotelSearch).choose_beginning_date no_of_days_start.to_i
end

And(/^user selects checkout date (.*) days from today$/) do |no_of_days_end|
  on(CheapoairHotelSearch).choose_end_date no_of_days_end.to_i
end

