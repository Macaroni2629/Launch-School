=begin
Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. 
A user passes in two numbers, and the calculator will keep computing the sequence
 until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got 
an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
How would you fix this so that it works?

# you have to make limit variable accessible to the method by passing it in as an argument
#fib does not have access to local variables outside the scope of the method
=end

