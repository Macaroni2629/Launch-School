# Using a while loop, print 5 random numbers between 0 and 99. 
# The code below shows an example of how to begin solving this exercise.

numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

# You use the size method to make sure that the number of elements of the array is not greater than 5.
# Once it is >= 5, the loop breaks.
# You use the shovel operator to insert random numbers from 0 to 99 into the numbers array.

#The printing must occur outside the while loop because if it is inside, it will print out each iteration.
