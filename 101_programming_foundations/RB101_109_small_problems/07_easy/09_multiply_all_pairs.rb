# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Examples:

def multiply_all_pairs(array1, array2)
  combos = array1.product(array2)
  combos.map do |subarray|
    subarray.reduce(:*)
  end.sort
end

def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

def multiply_all_pairs(array1, array2)
  
  array1.map do |number1|
    array2.map do |number2|
      number1 * number2
    end
  end.flatten.sort
end



p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]