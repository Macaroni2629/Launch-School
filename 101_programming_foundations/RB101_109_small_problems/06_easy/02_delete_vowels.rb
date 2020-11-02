# Delete vowels
# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# Example:

=begin
Given an array of strings, iterate through each word

delete upper and lowercase vowels, returning a string with no vowels

Return a new array with strings with no vowels


=end

def remove_vowels(array_of_words)
  array_of_words.map do |word|
    word.delete("aeiouAEIOU")
  end
end

def remove_vowels(array)

  array.map do |string|
    string.tr("aeiouAEIOU", '')
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']