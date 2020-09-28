# Say for example we have an array of nested arrays which contain numeric strings, 
# and we want to sort the outer array so that the inner arrays are ordered according
#  to the numeric value of the strings they contain. Take, for example, the following
#   4-element array of arrays.

arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# We know that we want to sort at the level of the outer array, but we can't simply 
# call sort on it. When sorting nested arrays it is important to understand that there
#  are two sets of comparison happening:

# Each of the inner arrays is compared with the other inner arrays.
# The way those arrays are compared is by comparing the elements within them (the documentation refers to this as comparing in an 'element-wise' manner)
# Because the elements in the arrays are strings, by calling sort it is string order which will ultimately determine array order:

# arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
# Since strings are compared character by character this doesn't give us a numerical comparison. In order to achieve this we have to perform some transformation on the inner arrays prior to comparing them.

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
# What is happening here?

# The key here is understanding that when we carry out transformation within a sort_by block, 
# the transformed elements are what are then used to perform the comparison. As long as what is 
# returned by the block is comparable, we can perform whatever transformation we need to within 
# the block - including nesting other method calls within it.

# In this case, each time the top-level block is called, we call map on the sub-array for 
#   that iteration, within the map block we call to_i on each string within that particular
#    sub-array, which returns a new array with integers and leaves the original sub-array unmodified.
#     This ends up sorting the outer array by comparing the transformed integers in the inner arrays,
#      which is what we're looking to do, without any side effects.