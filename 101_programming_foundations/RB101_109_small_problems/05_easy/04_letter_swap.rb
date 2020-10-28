# Letter Swap
# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

# Examples:

=begin

Algorithm

Split string into array of words.

Iterate through array of words.
  Perform multiple assignment--swap first letter with last letter
  return mutated string


=end

# def swap(string)
#   array_of_words = string.split
  
#   array_of_words.each do |word|
#     word[0], word[-1] = word[-1], word[0]
#   end.join(" ")
# end

def swap(string)
  string.split.map do |word| 
    word[0], word[-1] = word[-1], word[0]
    word
  end.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'