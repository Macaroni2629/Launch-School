Palindromic Strings (Part 1)
Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# Palindromic Strings (Part 1)
# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# Examples:

def palindrome?(string)
  string == string.reverse
  
end

# Further Exploration

# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

def palindrome?(word)
  word.to_s == word.to_s.reverse
end

# Further exploration: are the array elements all palindromes?

def palindrome_array?(array)
  array.all? { |ele| palindrome?(ele) == true }
end

# Further exploration: both palindromatic array and string

def palindrome_all?(element)
  element.all? { |ele| palindrome?(ele) == true } if element.class == Array
  element.to_s == element.to_s.reverse
end

# works for both a string and an array argument
def palindrome?(arg)
  arg == arg.reverse
end


p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true