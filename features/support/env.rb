require 'rspec'
require 'page-object'
require 'data_magic'
require 'yaml'

require_relative 'modules/utilities_module'

if ENV['browser_name'] == nil
  $browser_type = :chrome
else
  $browser_type = ENV['browser_name']
end

if ENV['env'] == nil
  environment_name = ENV['env'] = ''
else
  environment_name = ENV['env']
end
$url = "www.cheapoair#{environment_name}.com"
# environment_name=ENV['env']='qa'
World(PageObject::PageFactory)
