=begin
What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

I would expect return value 1, 2, 2, 3 on separate lines because you used #puts, which outputs strings with a line break.

And I would NOT expect 1, 2, 3 because #uniq method does not mutate the object.

=end
