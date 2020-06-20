def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0)
find_first_nonzero_among(1)

# The method find_first_nonzero_among expects an array.  The 2 arguments
# passed are string objects.  The error message said it received 6 arguments
# but only expected 1.  We should pass ONE array object.

# We should do this: find_first_nonzero_among{[0, 0, 1, 0, 2, 0]}
# And this: find_first_nonzero_among{[1]}  The second argument passed is
# an Integer.  Integers don't have an #each method.  We should pass in an array.
