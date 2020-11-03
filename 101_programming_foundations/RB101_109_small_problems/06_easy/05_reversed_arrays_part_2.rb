# Reversed Arrays (Part 2)
# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.



def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Discussion
# Well, nobody said reverse_each wasn't allowed! We could have solved this in a manner similar to the previous exercise, but where would the fun be in that? reverse_each is like each, except it processes the elements in reverse order. Note that unlike each, reverse_each only applies to Arrays.

# Note in particular that our tests include list.object_id != new_list.object_id. This verifies that the returned array is a brand new array, and not a modified form of the original way. Likewise, the second test of list == [1, 3, 2] confirms that the original array hasn't changed.

# Further Exploration
# An even shorter solution is possible by using either inject or each_with_object. Just for fun, read about these methods in the Enumerable module documentation, and try using one in your reverse method.

#further_exploration (each_with_object)
def reverse(array)
  array.each_with_object([]) do |element, collection|
    collection.unshift(element)
    collection
  end
end

#further_exploration (inject)
def reverse(array)
  array.inject([]) do |collection, element|
    collection.unshift(element)
    collection
  end
end