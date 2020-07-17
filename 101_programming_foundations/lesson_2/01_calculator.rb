# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

Kernel.puts("Welcome to Calculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract
3) multiply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f() 
end

Kernel.puts("The result is #{result}.")

# Is there a better way to validate that the user has input a number? 
# We'll cover this in more detail in a future assignment.
# You could method chain to_i, and then to_s and set it equal to the original string input to see if they are equal.
# This works for all integers except 0.

# It looks like you can call to_i or to_f to convert strings to integers and floats, 
# respectively. Look up the String#to_i and String#to_f documentation in Ruby docs
#  and look at their various examples and use cases.

# Our operation_to_message method is a little dangerous, because we're relying on 
# the case statement being the last expression in the method. What if we needed 
#   to add some code after the case statement within the method? What changes would '
#     be needed to keep the method working with the rest of the program? We'll show a
#      solution in an upcoming assignment.

