# Clean up the words
# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

=begin
Algorithm

Iterate through string, character by character.

Delete everything that's not an alpha character, and replace it with a space.

If there are multiple consecutive spaces, reduce the number of spaces so that there's only one space.


=end

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

def cleanup(string)
  clean_string = string.gsub(/[^a-z]/i, " ")
  clean_string = clean_string.squeeze(" ")
end

# Further Exploration
# If you originally wrote this method with regular expressions, try writing it without regular expressions.

def cleanup(string)
  almost_clean_array = string.split(" ").map do |element|
    element.tr('^a-z', ' ')
  end

  almost_clean_string = almost_clean_array.join(" ")
  almost_clean_string.gsub(/\s+/, ' ') # replaces several spaces w/single space
end


p cleanup("---what's my +*& line?") #== ' what s my line '