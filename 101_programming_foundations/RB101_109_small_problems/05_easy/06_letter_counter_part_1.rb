# Letter Counter (Part 1)
# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

=begin
Split string into array of words

Create an empty hash and set default value to 0.

Iterate through array of words.
  Count the number of characters
  Update the count of characters in the hash

=end

# Examples

# def word_sizes(string)
  
#   result_hash = Hash.new(0)
  
#   string.split.each do |word|
#     word_count = word.length
#     result_hash[word_count] += 1
#   end
  
#    result_hash
  
# end

def word_sizes(string)
  string.split.map do |word|
    word.size
  end.tally
  
end

def word_sizes(string)
  string.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.size] += 1}
end


p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('')# == {}