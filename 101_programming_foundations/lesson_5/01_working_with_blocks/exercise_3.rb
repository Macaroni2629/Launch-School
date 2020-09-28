[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin
 The Array#map method is being called on the multidimensional array [[1, 2], [3, 4]].  Each inner array
 is passed to the block in turn and assigned to the local variable arr.  The Array#first method
 is called on arr and returns the object at index 0 of the array, in this case 1 and 3 respectively. 
 
 And then puts method outputs a string representation of the integer.  Puts returns nil.

 The first method is called on arr and returns the object at index 0 of the array.  In this case, 1, and 3.
  Since this is the last line of the method, and map performs transofmration based on the return value of the block.

  [1, 3] is what is returned.


=end