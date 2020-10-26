# Convert a String to a Number!
# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

=begin
HARD CODE an array where the indexes are the integer version of the numbers and the values are the string versions named ARRAY_OF_NUM

Initiate result array named `result`

Iterate through string, character by character
  Using look up table ARRAY_OF_NUM, find the corresponding integer index value given the string version of the number element
  
  Push into result array the integer version
  
Reverse the result array

Initiate a sum result = 0

Iterate through the result array, digit by digit, with an index
  The first digit, multiply by 0 power of 10
  second digit, multiply by 1 power of 10
  And so on, and so forth
  Add each number to result array


=end

# Examples

ARRAY_OF_NUM = [*'0'..'9']

def string_to_integer(string_num)
  result = []
  string_num.each_char.with_index do |char, index|
    result << ARRAY_OF_NUM.index(char)
  end
  
  result = result.reverse
  
  sum = 0
  
  result.each_with_index do |num, index|
    sum += num * 10 ** index
  end
  
  sum
end


p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

Further Exploration
Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.
  
# Further Exploration
HEX_COLLECTION = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  "A" => 10, "B" => 11, "C" => 12, "D" => 13,
  "E" => 14, "F" => 15
}

def hexadecimal_to_integer(string)
  string_array = string.split("").reverse
  exponent_value = 0
  final_integer = 0

  string_array.each do |number|
    digit_value = HEX_COLLECTION[number.upcase]
    final_integer += digit_value * (16**exponent_value)
    exponent_value += 1
  end

  final_integer
end