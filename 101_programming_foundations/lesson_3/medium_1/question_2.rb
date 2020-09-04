=begin
The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

Why is this and what are two possible ways to fix this?

You can't concatenate a string to an integer.

You can do:

puts "the value of 40 + 2 is #{40 + 2}"

sum = 40 + 2

puts "the value of 40 + 2 is #{sum}."

or (40 + 2).to_s

=end
