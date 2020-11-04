# Capitalize Words
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples

def word_cap(string)
  array_of_words = string.downcase.split
  
  array_of_words.map do |word|
    word[0] = word[0].upcase
    word
  end.join(" ")
end

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'