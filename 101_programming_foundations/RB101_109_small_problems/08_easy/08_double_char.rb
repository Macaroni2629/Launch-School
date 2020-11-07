# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# Examples:

CONSONANTS = 'BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz'

def double_consonants(string)
  result = []
  string.each_char do |char|
    if CONSONANTS.include?(char)
      result << char * 2
    else
      result << char
    end
  end
  result.join
end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""