# Let's say we have the following data structure of nested arrays and
#  we want to increment every number by 1 without changing the data structure.

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
# This example is more complicated than the rest, but at this point you should
#  be able to break it down effectively. Use the tools you've learned about in
#   this lesson and take as much time as needed. Work on breaking down each
#    component and understanding the return value of each expression. What will 
#    be the final return value? Check the solution only after you've tried this
#     on your own.

# If we want to add 1 to each value we first need to find a way to 
# access those values, regardless of how many arrays they're nested in. 
# To do this, we determine if the current element is an array or an integer
#    and then execute the appropriate code.

# map is a good choice for this task because it returns a new 
# array containing transformed values. This way we can ultimately 
# return a new array with the same nested levels as the original.

# In practice, this type of nested data processing is typically a sign of bad design.