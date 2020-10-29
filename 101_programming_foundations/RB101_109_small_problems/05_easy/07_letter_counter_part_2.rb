# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

=begin
Delete nonalpha characters from string

Break up string into array of words

Initialize results_hash and set default value to 0.

Iterate through words
  Count the letters in each word
  Update the hash


=end

# Examples

# def word_sizes(string)
#   clean_string = string.gsub(/[^a-zA-Z]/, " ")
  
#   results_hash = Hash.new(0)
  
#   clean_string.split do |word|
#     results_hash[word.length] += 1
#   end
  
#   results_hash
# end

def word_sizes(string)
  clean_string = string.gsub(/[^a-zA-Z]/, " ")
  
  clean_string.split.map { |word| word.size }.tally
  
end

def word_sizes(string)
  string.delete!("^a-z^A-Z^ ")
  string.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.size] += 1}
end



p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") #== { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') #== {}