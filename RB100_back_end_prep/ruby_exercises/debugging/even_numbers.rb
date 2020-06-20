numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]

# #map returns a value for each element of the original array.  We want a
# method that returns only the TRUE ones.  Array#select method is one that does this.
