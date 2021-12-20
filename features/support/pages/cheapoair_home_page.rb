class CheapoairHomePage
  include PageObject
  require_relative '../modules/utilities_module'
  include UtilitiesModule
  page_url "www.cheapoair.com"

  #Home page available tabs
  link(:selecting_flight_tab, class: 'navigation__link', index: 0)
  link(:selecting_hotels_tab, class: 'navigation__link', index: 1)
  link(:selecting_cars_tab, class: 'navigation__link', index: 2)
  link(:selecting_packages_tab, class: 'navigation__link', index: 3)
  link(:selecting_activities_tab, class: 'navigation__link', index: 4)

  link(:clearing_the_text_dep, class: 'suggestion-box__clear icon', index: 0)
  link(:claring_the_text_arr, class: 'suggestion-box__clear icon', index: 1)
  text_field(:set_dep_edit_box, id: 'from0')
  text_field(:set_arr_edit_box, id: 'to0')
  ul(:all_dep_airports, class: 'suggestion-box__list autoSuggest__list', index: 0)
  ul(:all_arr_airports, class: 'suggestion-box__list autoSuggest__list', index: 1)

  text_field(:clicking_on_dep_date, id: 'cal0')
  # link(:selecting_dep_date, aria_label: @fut_dep_date)
  text_field(:clicking_on_arr_date, id: 'cal1')
  # link(:selecting_arr_date, aria_label: @fut_arr_date)
  #
  button(:search_flights, id: 'searchNow')
  div(:claender_month, class: 'calendar__single-month active', index: 0)
  ul(:error_messages, class: 'alerts__list')
  ul(:error_messages_part2,class:'alerts__list',index:0)


  def search_dep_airport dep_airport, dep_airport_code
    #@browser.link(class: 'suggestion-box__clear icon').click if @browser.link(class: 'suggestion-box__clear icon').present?
    clearing_the_text_dep_element.click if clearing_the_text_dep_element.present?

    set_dep_edit_box_element.send_keys dep_airport
    # self.set_dep_edit_box=dep_airport
    # you can use this way also. when you are doing self. no need of _element. you can do this only for edit box.
    sleep 2
    # @browser.text_field(id: 'from0').set dep_airport
    all_dep_airports_element.list_item_elements.each do |all_dep_airport|
      #we give _elements, lis is using watir
      # .list_item_elements is using page object
      # .list
      p all_dep_airport.text
      if all_dep_airport.text.include? dep_airport_code
        all_dep_airport.click
        break
      end
    end
  end

  def search_arr_airport arr_airport, arr_airport_code
    claring_the_text_arr_element.click if claring_the_text_arr_element.present?
    # it is deleting the details from dep tab, when I searched for it I dont find multiple values.
    set_arr_edit_box_element.send_keys arr_airport
    sleep 2
    # @browser.input(id: 'to0').set arr_airport
    # @browser.div(class:'suggestion-box__content air is-visible').lis.each do|all_arr_airports|
    # we cannot use div  right for unordered list, even it highlights the all of the list of values?
    all_arr_airports_element.list_item_elements.each do |all_arr_airports|
      p all_arr_airports.text
      #why not giving me the arrival airpots list?
      if all_arr_airports.text.include? arr_airport_code
        all_arr_airports.click
        break
        #  selecting the all airports Cleveland, I want it to select the second one.
      end

    end
  end

  # def cal_date no_of_days
  #   (Time.now + 24 * 60 * 60 * no_of_days).strftime("%-d %B %Y")
  # end

  def choose_dep_date (no_of_days)
    clicking_on_dep_date_element.click
    # @fut_dep_date = cal_date no_of_days
    # can I make it instance variable like this?
    fut_dep_date = cal_date no_of_days
    # dep_date='14 December 2021'
    # selecting_dep_date_element.click
    # in page object we cannot make names for dynamic values??
    @browser.a(aria_label: fut_dep_date).click
    # claender_month_element.a(aria_label: fut_dep_date).click
    sleep 5
  end

  def choose_arr_date (no_of_days)
    clicking_on_arr_date_element.click
    # @fut_arr_date = cal_date no_of_days
    fut_arr_date = cal_date no_of_days
    # arr_date = '30 December 2021'
    # selecting_arr_date_element.click
    @browser.a(aria_label: fut_arr_date).click
    # claender_month_element.a(aria_label: fut_arr_date).click
  end

  def search_flights
    search_flights_element.click
    sleep 5

  end

  def clearing_dep_field
    clearing_the_text_dep_element.click if clearing_the_text_dep_element.present?

  end

  def clearing_arr_field
    claring_the_text_arr_element.click if claring_the_text_arr_element.present?
  end

  def error_message_from_city_to_city
    puts error_messages_element.text
    #     all_errors = []
    # error_messages_element.list_item_elements.each do |each_error|
    #   all_errors << each_error.text
    # end
    # all_errors
    #     # or, you can use the following way
    #     # error_messages.map(&:text)
  end
  def error_messages_from_city_to_city_dates
    puts error_messages_part2_element.text
  end
end
