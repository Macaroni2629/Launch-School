# Stringy Strings
# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(integer)
  array = []
  (1..integer).each do |integer|
    if integer.odd?
      array << '1'
    else
      array << '0'
    end
  end
  
  array.join
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'