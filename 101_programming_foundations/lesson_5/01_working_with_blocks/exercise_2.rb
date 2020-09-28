[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

=begin

The Array#map method is being called on the multi-dimensional array [[1, 2], [3, 4]].  Each inner array
is passed to the block in turn and assigned to the local variable arr. 

The Array#first method is being called on arr and then returns the object at index 0 of the current array.
In this case the integers 1, and 3  respectively.

  The puts method then outputs the string representation of the integer.  Puts returns nil, and since this
  is the last evaluated statement within the block, the return value of the block is therefore nil.

  Map does something with this returned value.  Map performs transformation based on the return 
  value of the block.  The return value of map is a new array.  In this case [nil, nil]
    is what is returned.