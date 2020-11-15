# Getting Things Done
# We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?
  
# def move(n, from_array, to_array)
#   to_array << from_array.shift
#   move(n - 1, from_array, to_array)
# end

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin


Approach/Algorithm
Every recursion needs a base case, i.e. a condition under which it will stop. Our method doesn't have one, so it just repeatedly calls itself with ever decreasing values for n:


move(2, ..., ...)
move(1, ..., ...)
move(0, ..., ...)
move(-1, ..., ...)
move(-2, ..., ...)
...
In order to know where it needs to return to after finishing each of these calls, Ruby puts each call on a call stack. Since we never stop, this stack keeps growing and growing, until it exceeds its limit. This causes the SystemStackError - a real stack overflow!

In order to fix this, we need to add a condition under which the recursion stops.

Solution

def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo #=> ['coffee with Tom']
p done #=> ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

Discussion
We want to stop as soon as we have moved n elements from one array to the other, i.e. when n == 0. The code we have added on line 2 of the solution tells Ruby to return from the method when that condition is met.

Further Exploration
What happens if the length of the from_array is smaller than n?

=end