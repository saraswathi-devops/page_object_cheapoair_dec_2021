class CheapoairFlightSearchResultsPage
  include PageObject

  div(:search_results,class: 'filters--content col-12 p-0')

  def actual_flight_results
    #actual_results = @browser.div(class: 'filters--content col-12 p-0').text.to_i
    actual_results = search_results_element.text.to_i
  end
  def selecting_cheapflights_tab
    @browser.li(class:'col p-0 sort-tab__item is--tab-cheapest is--tab-active').click
  end
  def get_all_flights_prices
    all_prices=[]
    @browser.divs(class:'fare-details__fare').each do |each_price|
      all_prices<<each_price.text
      p all_prices
    end
  end
end

