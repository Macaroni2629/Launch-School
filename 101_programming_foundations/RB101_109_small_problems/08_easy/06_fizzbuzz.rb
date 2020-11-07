# fizzbuzz
# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# Example:

# def fizzbuzz(num1, num2)
#   result = []
#   (num1..num2).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#       result << "FizzBuzz"
#     elsif num % 3 == 0
#       result << "Fizz"
#     elsif num % 5 == 0
#       result << "Buzz"
#     else
#       result << num
#     end
#   end
  
#   result.join(', ')
# end

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

# Discussion
# There may be a couple of things that you haven't encountered in this solution. First, notice that we use a case statement in the fizzbuzz_value method. This case statement doesn't have a value next to case for comparison. When using a case statement in this form, we get the same functionality as if we used an if/elsif/else conditional.

# Another thing of interest is that there isn't anything other than that case statement in fizzbuzz_value method. This works because a case statement returns the value from the last line of the matched when branch. For example, if a number is divisible only by 3, then 'fizz' is returned from the case statement. That return value then acts as the return value for the method, since there are no other lines after this case statement.



p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz