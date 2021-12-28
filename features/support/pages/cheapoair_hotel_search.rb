class CheapoairHotelSearch
  include PageObject
  require_relative '../modules/utilities_module'
  include UtilitiesModule
  page_url "www.cheapoair.com"
  link(:clearing_hotels_field, aria_label: 'clear field', index: 0)
  text_field(:search_city_hotels, id: 'from')
  ul(:all_hotels, class: 'suggestion-box__list autoSuggest__list', index: 0)
  text_field(:clicking_on_beginning_date, id: 'cal0')
  # link(:selecting_dep_date, aria_label: @fut_dep_date)
  text_field(:clicking_on_ending_date, id: 'cal1')
  button(:click_on_room_travelers_tab,id:'travellerButtonHotel')


  def clearing_hotels_editbox
    clearing_hotels_field_element.click if clearing_hotels_field_element.present?
  end

  def hotel_search_criteria city_name_hotel_search, state_name
    clearing_hotels_field_element.click if clearing_hotels_field_element.present?
    #self.search_city_hotels = city_name_hotel_search
    # search_city_hotels_element.set city_name_hotel_search
    search_city_hotels_element.when_present.set city_name_hotel_search
    all_hotels_element.when_present.list_item_elements.each do |all_cities|
      p all_cities.text
      if all_cities.text.include? state_name
        all_cities.click
        sleep 2
        break
      end
    end
  end

  def choose_beginning_date (no_of_days)
    clicking_on_beginning_date_element.click
    # @fut_dep_date = cal_date no_of_days
    # can I make it instance variable like this?
    start_date = cal_date no_of_days
    # dep_date='14 December 2021'
    # selecting_dep_date_element.click
    # in page object we cannot make names for dynamic values??
    @browser.a(aria_label: start_date).click
    # claender_month_element.a(aria_label: fut_dep_date).click
    sleep 5
  end

  def choose_end_date (no_of_days)
    clicking_on_ending_date_element.click
    # @fut_arr_date = cal_date no_of_days
    end_date = cal_date no_of_days
    # arr_date = '30 December 2021'
    # selecting_arr_date_element.click
    @browser.a(aria_label: end_date).click
    # claender_month_element.a(aria_label: fut_arr_date).click
  end
  def choose_room_travelers
    click_on_room_travelers_tab_element.click
  end

  sleep 2
end