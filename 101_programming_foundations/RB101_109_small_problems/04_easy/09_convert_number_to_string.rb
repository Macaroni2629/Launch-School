# Convert a Number to a String!
# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

=begin

Algorithm
Given an integer
Create an array look up table in which the indices are the integer version of the numbers, and string versions of the numbers are elements

Break integer into digits


=end

# Examples
# ARRAY_NUMBERS = [*'0'..'9']

# def integer_to_string(integer)
#   answer = []
#   array_of_digits = integer.digits.reverse
#   array_of_digits.each do |digit|
#     answer << ARRAY_NUMBERS[digit]
#   end
#   answer.join 
# end

# def integer_to_string(integer)
#   integer.digits.reverse.map { |digit| ARRAY_NUMBERS[digit] }.join
# end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'