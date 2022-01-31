# difference between single quotes and double quotes and :
# p 'hello'
# p "hello"
# p :hello
# p ' i\'m sara'
# whenever u use single quotes, you won't be able use interpolation, also for using apostrophe you need to use back slash\.
# can not use : for printing when using back slash.
#x="checkvaluessssss"
# p x[0,10]
# p x[10,16]
# using square brackets for printing value, you can mention from which character to which character you want for printing.
# p x[0.10] gives you from zero character to 10 th character. ie.checkvalue
# a=12345
# p a.to_s.reverse
# for using .reverse method, first you need to convert a variable into string.
# array.compact
# Returns a copy of self with all nil elements removed.
# name=['sara',0,nil,'find']
# p name.compact
# means when you use array.compact it will remove the words with nil.
#array=[0,1,2,3,4,4,5]
# array.delete_at(5)
# p array
# arr =  [1, 2, 3, 4, 5, 6]
# arr.pop[6]
# p arr
# # To retrieve and at the same time remove the first item, use shift:
#
#   arr.shift[1]
# p arr
# # To delete an element at a particular index:
# arr.delete_at(2)
# p arr
# # arr #=> [2, 3, 5]
# for printing the array with .delet_at(index), first define and then print.
#
# array.delete_if { |item| block }
# Deletes every element of self for which block evaluates to true.
# array=[10,20,30,40,50,]
# array.delete_if{|array| array<=30}
# p array
# array.fetch(index) [or]
=begin
array.fetch(index, default) [or]
array.fetch(index) { |index| block }
Tries to return the element at position index. If index lies outside the array, the first form throws an IndexError exception,
 the second form returns default,
and the third form returns the value of invoking block, passing in index.
Negative values of index count from the end of the array.
=end
#we can use =begin and =end tokens for commenting.
# a=[11,12,13,14]
# p a.fetch(0)
# p a.fetch(-1)
# p a.fetch(1,'cat')
# p a.fetch(100){|i| puts "#{i} is out of bounds"}
# Ruby Hashes:
# A Hash is a collection of key-value pairs like this: "employee" => "salary".
# It is similar to an Array, except that indexing is done via arbitrary keys of any object type, not an integer index.
# The order in which you traverse a hash by either key or value may seem arbitrary and will generally not be in the insertion order.
# If you attempt to access a hash with a key that does not exist, the method will return nil.
# You can use a Hash to give names to objects:
# months=Hash.new("Jan")
# puts "#{months[0]}"
# puts "#{months[100]}"
# When you access any key in a hash that has a default value, if the key or value doesn't exist, accessing the hash will return the default value:
# H=Hash["a"=>100, "b"=>200]
# p "#{H['a']}"
# p "#{H['b']}"
# p H['a']
# details={:a=>100,:name=>"sara"}
# details.each do |i,j|
#   p details[i]
#   p details[j]
# end
# don't know what j is referring here??
# A Range represents an interval—a set of values with a beginning and an end.
# range=('a'..'g').to_a
# puts "#{range}"
# p "please enter your name?"
# name=gets
# puts "hi #{name}"
