# Reverse It (Part 2)
# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

=begin
Algorithm:
Split string into array of words

Iterate through each word
  If the size of the word is 5 or more characters, switch the first and last letters.
  
Rejoin the array of words into one string, with spaces in between
=end

# Examples:

def reverse_words(string)
  array_of_words = string.split
  
  result = []
  
  result = array_of_words.each do |word|
    if word.size >= 5
      result << word.reverse!
    else
      result << word
    end
  end
  
  result.join(" ")
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS