# Merge Sort
# Sort an array of passed in values using merge sort. You can assume that this array may contain only one type of data. And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays in sorted order. It is best shown by example. For instance, let's merge sort the array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end


def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

# Discussion
# Merge sort is one of the more efficient sorting algorithms. However, because of its efficiency, it can be a bit difficult to understand (not to say that everything that is efficient is hard to understand). Let's break this down, step by step.

# Our solution uses the merge method from the previous exercise.

# Our method takes the array passed in, and turns it into two smaller arrays. If the size of the original array is even, then we get two even sized arrays. If it is odd, then sub_array_1 will be odd in size and sub_array_2 will be even. We do this to break our sorting procedure into smaller, more manageable steps. It doesn't really matter where you put the extra element in odd-sized arrays, so long as you put it in one of the two sub-arrays.

# After splitting the array into two sub-arrays, we call ourselves recursively, first on one of the sub-arrays, then on the other. Each of these two calls will sort the subarray by repeating this process until the trivial case of sorting a one-element array is encountered; at this point, we just return that array as-is (it is already sorted).

# Once we have the sub-array results, we merge them together using our merge method. With each merge, we take two small sub-arrays, and return a larger array that contains all of the elements from both sub-arrays. This repeats at each level until we reach the top level. At this point, the final sorted array is returned to the caller.

# Further Exploration
# Every recursive algorithm can be reworked as a non-recursive algorithm. Can you write a method that performs a non-recursive merge sort?