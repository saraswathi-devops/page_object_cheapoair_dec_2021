class GoogleHomePage
  include PageObject
  page_url "www.google.com"
  # @browser.text_field(class:'gLFyf gsfi').click
  # in the Page object style instead of @browser, we just say input and provide the properties, by defining it.
  # we give meaning ful names to the properties.
  # @browser.text_field(class:'gLFyf gsfi').set search_criteria
  text_field(:search_criteria, class: 'gLFyf gsfi')
  text_field(:clicking_on_search, class: 'gLFyf gsfi')
  div(:search_results, id: 'result-stats')
  text_field(:searching_for, class: 'gLFyf gsfi')

  def get_search_results
    actual_results = search_results_element.text
    actual_results = actual_results.split(" ")[1].gsub(",", "").to_i
    p actual_results
  end

  def search_google_for search_criteria
    searching_for_element.set search_criteria
    searching_for_element.send_keys :enter

    # @browser.button(value:'Google Search').click
  end
end