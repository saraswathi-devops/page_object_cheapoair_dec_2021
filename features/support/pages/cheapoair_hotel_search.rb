class CheapoairHotelSearch
  include PageObject
  require_relative '../modules/utilities_module'
  include UtilitiesModule
  page_url "www.cheapoair.com"
  a(:clearing_hotels_field, aria_label: 'clear field', index: 0)
  div(:search_city_hotels, class: 'col-12 col-lg-3 col-xl-4')
  div(:all_hotels, class: 'suggestion-box__content hotel is-visible')

  def clearing_hotels_editbox
    clearing_hotels_field_element.click if clearing_hotels_field_element.present?
  end

  def hotel_search_criteria city_name_hotel_search, city_hotel_search_airport_code
    clearing_hotels_field_element.click if clearing_hotels_field_element.present?

    search_city_hotels_element.set city_name_hotel_search
    all_hotels_element.list_item_elements.each do |all_cities|
      p all_cities.text
      if all_cities.text.include? city_hotel_search_airport_code
        all_cities.click
        break
      end
    end
  end
end