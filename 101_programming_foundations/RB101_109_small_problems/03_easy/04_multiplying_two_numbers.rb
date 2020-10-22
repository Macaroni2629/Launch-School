# Multiplying Two Numbers
# Create a method that takes two arguments, multiplies them together, and returns the result.

# Example:

# multiply(5, 3) == 15

def mult_two_num(number1, number2)
  
  p number1 * number2
end

mult_two_num(5, 6)

# There are a couple of points of interest for this solution.

# Focus on the return value. Consider the below incorrect implementation.

# def multiply(n1, n2)
#   puts n1 * n2
# end

# multiply(1, 2) # returns nil
# If you run the code above, you may think that this method fulfills the requirements of the exercise, but it doesn't. It's important to remember to focus on the method's return value and not its output. Also, keep in mind that puts returns nil,and the above incorrect implementation will always return nil.

# The current implementation uses the * operator, which behaves differently depending on what the left hand expression is. For example:

# Copy Code
# 5 * 2       # => 10
# "hi" * 2   # => "hihi"
# Therefore, our method implementation also suffers from this behavior since we're using the * operator.

# Further Exploration
# For fun: what happens if the first argument is an Array? What do you think is happening here?

# further exploration
def multiply(array, num_two)
  array * num_two
end

num_array = [1, 2, 3, 4, 5]

p multiply(num_array, 3)# => [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

# It looks like the array [1, 2, 3, 4, 5] object itself is being multiplied 3 times
# like this [1, 3, 4, 4, 5] * 3 to create one long array of the same 5 repeating
# elements. The array object_id is the same throughout the method but the contents 
# of the array has changed.