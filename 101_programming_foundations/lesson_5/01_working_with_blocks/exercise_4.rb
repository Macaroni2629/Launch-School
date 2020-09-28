my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18
# 7
# 12
# => [[18, 7], [3, 12]]

=begin
The Array#each method is called on the multidimensional array [[18, 7], [3, 12]].    Each inner array
is passed to the block in turn and assigned to the local variable arr.

The Array#each method is being called on arr.  Each element from the arr subarray is passed to the block in turn
and assigned to the local variable num.
The if conditional is evaluated on line 3.  If the element from the arr subarray is greater than 5,
then the number is outputted by puts.

Hence, the outputs will be 18, 7, and 12.

The return value of Array#each method is always the original calling object, which, in this case, is
[[18, 7], [3, 12]]

=end