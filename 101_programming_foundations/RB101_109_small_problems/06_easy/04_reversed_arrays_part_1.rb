# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# Examples:

=begin
Algorithm

Initialize empty array `holder_array` = []

Duplicate `list` and initialize variable `list_dup`

Iterate through `list`, number by number
  Push out last number of `list_dup` 
  Push last number into `holder_array` [4, 3, 2, 1]
  
  list = [1, 2, 3, 4]
  list_dup = [1, 2, 3] -> holder_arr = [4]
  
Iterate through `list_dup`, number by number
  Pop out last number of `holder_array
  Push last number into `list`
  
Return `list`

=end

# def reverse!(list)
  
#   list_dup = list.dup
  
#   holder_array = []
  
#   list_dup.each do |num|
#     holder_array << list.pop # [4, 3, 2, 1]
#   end
  
#   # p holder_array
  
#   list_dup.each do |num|
#     list << holder_array.shift
#   end
  
#   list
# end

def reverse!(list)
  index = 0
  index2 = -1
  while index < list.size / 2
    list[index], list[index2] = list[index2], list[index]
    index += 1
    index2 -= 1
  end
  
  list
end



list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]

list = []
p reverse!(list) == []
p list == []