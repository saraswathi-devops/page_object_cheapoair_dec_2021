require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  #@browser = Watir::Browser.new :'chrome'
  @browser = Watir::Browser.new $browser_type
  @browser.driver.manage.window.maximize
end

After do
  @browser.close
end
After do |scenario|
  SCREENSHOTS_DIRECTORY = "reports"
  if (scenario.failed?) and ($hide_screenshot == true)
    time_stamp = Time.now.to_s.gsub('-','_').gsub(' ', '_').gsub(':','_').gsub('+','').gsub(/_0530/,'')
    # screenshot = "#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z]/,'')}_#{time_stamp}.png"
    screenshot = "#{scenario.name.gsub(' ','_')}_#{time_stamp}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY,screenshot))
    embed(File.join(SCREENSHOTS_DIRECTORY,screenshot),"image/png",'SCREENSHOT')
  end
end
