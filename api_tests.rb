require 'rest-client'
require 'json'
#url='http://services.groupkt.com/state/get/IND/all'
url='http://172.16.104.129:1234/listUsers'
response=RestClient.get(url)
p response
puts "my response: #{response}"
puts "++++++"
value = JSON.parse(response)
puts "value is #{value}"