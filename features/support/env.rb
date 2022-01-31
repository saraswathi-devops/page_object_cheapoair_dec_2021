require 'rspec'
require 'page-object'
require 'data_magic'
require 'yaml'

require_relative 'modules/utilities_module'

$hide_screenshot = true

if ENV['browser_name'] == nil
  $browser_type = :chrome
else
  $browser_type = ENV['browser_name']
end

target_browser = :chrome
case ENV['BROWSER']
when 'IE'
  target_browser = :ie
when 'FF'
  target_browser = :ff
else
  target_browser = :chrome
end
@browser = Watir::Browser.new target_browser

case ENV['ENVIRONMENT']
when 'CI'
  puts 'using CI environment'
  $base_url = 'http://www.cheapoair.com/'
  $db_host = 'adev01:8066'
  #  connecting to data base server
when 'ITG'
  puts 'using ITG environment'
  $base_url = 'https://www.cheapoairitg.com/'
when 'QAREG'
  puts 'using QA Reg environment'
  $base_url = 'https://www.cheapoairqa.com/'
else
  puts 'using default environment (local)'
  $base_url = 'http://localhost:8080/cheapoair/'
  $db_host = 'localhost:8083'

end

if ENV['env'] == nil
  environment_name = ENV['env'] = ''
else
  environment_name = ENV['env']
end
$url = "www.cheapoair#{environment_name}.com"
# environment_name=ENV['env']='qa'
World(PageObject::PageFactory)
