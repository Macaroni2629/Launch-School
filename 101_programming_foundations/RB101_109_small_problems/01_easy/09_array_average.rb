# Sum of Digits
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Examples:

=begin
 Given an integer
 
 Clean the integer, delete anything that's not a number.

 Break into array of digits

 Sum the digits

=end

INTEGERS = [0..9]

def sum(integer)
  result = 0
  array_of_digits = integer.digits
  array_of_digits.each do |num|
    result += num
  end
  result
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).