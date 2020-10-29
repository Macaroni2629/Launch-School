# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=begin

Given an array of numbers

Iterate through each number
  Sort by the word version of the number.
  
=end


# Examples:

# ARRAY_WORDS = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]


# def alphabetic_number_sort(array_of_integers)
  
#   array_of_integers.sort_by do |integer|
#     ARRAY_WORDS[integer]
#   end
# end

# Further Exploration
NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  array.sort do |a, b|
    NUMBER_WORDS[a] <=> NUMBER_WORDS[b]
  end
end

# Further Exploration
# Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

# For an extra challenge, rewrite your method to use Enumerable#sort (unless you already did so).

# In the above solution Array#sort_by! was not used in order to
# avoid mutating the original numbers array.


p alphabetic_number_sort((0..19).to_a) #==   
[
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]