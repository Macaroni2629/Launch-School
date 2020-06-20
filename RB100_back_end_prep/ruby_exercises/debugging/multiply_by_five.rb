def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"

# You're multiplying a string by five in line 2, because on line 6, you're
# implementing the #gets string method.  You're multiplying a string by 5.
# You need to change the data types to watch.  You want integer times integer.
