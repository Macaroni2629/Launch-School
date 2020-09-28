[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

=begin
The Array#map method is invoked on the multidimensional array [[1, 2], [3, 4]].  Each inner array is
passed to the block in turn and assigned to the local variable arr.  

The Array#map method is called on each subarray arr and each integer element is passed to the
block variable num.
  Each number is evaluated on line 3.

The return value of Array#map is a transformed array based on the block's return value.  Here, we do this twice,
paying attention to the 4 return values: the 2 map invocations and the 2 blocks within each invocation.


=end