require 'rspec'
require 'page-object'
require 'data_magic'
if ENV['browser']==nil
  $browser_type = :chrome
else
  $browser_type=ENV['browser']
end
if ENV['env']==nil
environment_name=ENV['env']=''
else
environment_name=ENV['env']
end
$url="www.cheapoair#{environment_name}.com"
# environment_name=ENV['env']='qa'
World(PageObject::PageFactory)
