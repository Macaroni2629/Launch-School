# Sum or Product of Consecutive Integers
# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

=begin
Ask user for an integer greater than 0.
  Ask them to enter s for sum or p for product.
  
if sum, pass integer to sum method
  In sum method, sum up the integers from 1 and the integer.
  return string interpolated sentence.
  
If product, pass integer to product method.
  In product method, sum. upthe integers from 1  to the integer
  return string interpolated sentence

=end

def sum_action(number)
  sum = (1..number).reduce(:+)
  puts "The product of the numbers between 1 and #{number} is #{sum}."
end

def multiply_action(number)
  product = (1..number).inject(:*)
  puts "The product of the numbers between 1 and #{number} is #{product}."
end

def sum_or_multiply
    puts "Please enter an integer greater than 0."
    number = gets.chomp.to_i
loop do
    puts "Enter 's' to computer the sum, 'p' to compute the product."
    action = gets.chomp
    if action == 's'
      break sum_action(number)
    elsif action == 'p'
      break multiply_action(number)
    else
      puts "Invalid response.  Please try again."
    end
 end
end

sum_or_multiply

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end