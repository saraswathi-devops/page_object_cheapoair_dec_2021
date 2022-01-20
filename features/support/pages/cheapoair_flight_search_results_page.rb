class CheapoairFlightSearchResultsPage
  include PageObject

  div(:search_results, class: 'filters--content col-12 p-0')
  li(:cheapest_flights_tab, class: 'col p-0 sort-tab__item is--tab-cheapest')
  divs(:all_flights_prices, class: 'fare-details__fare')

  def actual_flight_results
    #actual_results = @browser.div(class: 'filters--content col-12 p-0').text.to_i
    actual_results = search_results_element.when_present(30).text.to_i
    actual_results_text = search_results_element.when_present(30).text
  end

  def selecting_cheapflights_tab
    cheapest_flights_tab_element.click
  end

  def get_all_flights_prices
    all_prices = []
    all_flights_prices_elements.each do |each_price|
      all_prices << each_price.text.gsub('$', '').to_i
    end
    all_prices

  end

  def verify_flights_displayed?
    fail "Flight search results not found" unless search_results_element.when_present(30).text.include? 'results found'
  end
end

