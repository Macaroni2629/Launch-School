# Convert a String to a Signed Number!
# In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

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

def string_to_signed_integer(string_num)
  case string_num[0]
  when '-' then -string_to_integer(string_num[1..-1])
  when '+' then string_to_integer(string_num[1..-1])
  else          string_to_integer(string_num)
  end
  
end



p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100