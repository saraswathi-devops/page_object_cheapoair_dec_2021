require 'rest-client'
require 'json'
require 'rspec/expectations'
require_relative 'rspec/core'
url = 'https://jsonplaceholder.typicode.com/users/1'
# response = RestClient.get(url)
response = RestClient.post(url, {})
p response
puts "my response: #{response}"
puts "++++++"
value = JSON.parse(response)
puts "value is #{value}"
expect(value["username"]).should eq "Samantha"