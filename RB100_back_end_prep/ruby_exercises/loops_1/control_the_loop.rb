# Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
    puts "Number of iterations = #{iterations}"
    iterations += 1
    break if iterations > 5
end

# One needs to create a count (iterations) to increment and keep track of how many iterations there are.
# One also needs to break (break if) the loop once the number of iterations requirement has been met.
