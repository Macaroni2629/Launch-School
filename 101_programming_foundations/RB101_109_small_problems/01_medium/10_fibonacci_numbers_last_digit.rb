# Fibonacci Numbers (Recursion)
# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# Sequences like this translate naturally as "recursive" methods. A recursive method is one in which the method calls itself. For example:


# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
# sum is a recursive method that computes the sum of all integers between 1 and n.

# Recursive methods have three primary qualities:

# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.
# In the code above, sum calls itself once; it uses a condition of n == 1 to stop recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute a new return value.

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# If you find yourself struggling to understand recursion, see this forum post. It's worth the effort learning to use recursion.

# That said, this exercise is a lead-in for the next two exercises. It verges on the Advanced level, so don't worry or get discouraged if you can't do it on your own. Recursion is tricky, and even experienced developers can have trouble dealing with it.

# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end

# def fibonacci(number)
#   return 1 if number == 1
#   return 1 if number == 2
  
#   fib = ["space", 1, 1]
  
#   index = 3
  
#   loop do 
#     fib[index] = fib[index - 1] + fib[index - 2]
#     return fib[index] if index == number
#     index += 1
#   end
  
# end

# def fibonacci(nth)
#   return 1 if nth <= 2
#   fibonacci(nth - 1) + fibonacci(nth - 2)
# end

# # Examples:

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765
#----------------------------------------------------------

# Fibonacci Numbers (Procedural)
# In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number. In a language that is not optimized for recursion, some (not all) recursive methods can be extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion; as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth, the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results without recursion.

# Examples:


# def fibonacci(number)
#   first, last = [1, 1]
#   3.upto(number) do
#     first, last = [last, first + last]
#   end

#   last
# end
  

# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

# Discussion
# If you remembered that we previously encountered a procedural treatment of the Fibonacci series in the easy exercises, you may have stolen most of your solution from there. That's fine - we did too. However, we didn't stop at that point; we did a bit of refactoring after removing the indexing code, and ended up with a nice simple solution to the problem.

# This method starts out with an array of two numbers, [1, 1], to represent the first 2 numbers in the Fibonacci sequence. It then proceeds to calculate each of the Fibonacci numbers in turn, updating the array in each iteration to include the two most recent Fibonacci numbers.

# This solution is extremely fast; it will compute the 100,001st Fibonacci number - a 20,899-digit number - in about a second. That's a huge improvement over the recursive solution.
#-------------------------------------
# Fibonacci Numbers (Last Digit)
# In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

# Examples:

def fibonacci_last(number)
  first, last = [1, 1]
  3.upto(number) do
    first, last = [last, first + last]
  end

  last.digits.reverse.last
end

def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4