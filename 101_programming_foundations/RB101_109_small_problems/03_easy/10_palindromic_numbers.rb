# Palindromic Numbers
# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(integer)
   palindrome?(integer.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Discussion
# The hardest part of this program is recognizing that the easiest way to tell if a number is palindromic is to convert it to a string first, then check whether that string is palindromic. To determine if the string is palindromic, we use the palindrome? method we wrote earlier.

# Further Exploration
# Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end