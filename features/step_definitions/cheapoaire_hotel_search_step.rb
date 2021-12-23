And(/^user search the "([^"]*)" city and selects "([^"]*)" airport as destination$/) do |city_name_hotel_search, city_hotel_search_airport_code|
  # on(CheapoairHotelSearch).clearing_hotels_editbox
  on(CheapoairHotelSearch).hotel_search_criteria city_name_hotel_search,city_hotel_search_airport_code
end