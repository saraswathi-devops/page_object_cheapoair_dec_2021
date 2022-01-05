class CheapoairFlightSearchResultsPage
  include PageObject

  div(:search_results,class: 'filters--content col-12 p-0')

  def actual_flight_results
    #actual_results = @browser.div(class: 'filters--content col-12 p-0').text.to_i
    actual_results = search_results_element.text.to_i
  end
end
