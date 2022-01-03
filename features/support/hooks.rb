require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :'chrome'
  # @browser = Watir::Browser.new :$browser_type
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end