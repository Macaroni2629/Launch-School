# Running Totals
# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(array_of_integers)
  
  result_array = []
  
  array_of_integers.each_with_index do |number, index|
    result_array << array_of_integers[0..index].sum
  end
  
  result_array
end

def running_total(array_of_integers)
  array_of_integers.map.with_index do |number, index|
    array_of_integers[0..index].sum
  end
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

def running_total(array)
  final_array = []

  array.each_with_object([]) do |num, object|
    object << num
    final_array << object.reduce(:+)
  end
  final_array
end




p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []