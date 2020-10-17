# Odd
# Write a method that takes one integer argument, which may be positive, 
#negative, or zero. This method returns true if the number's absolute value 
#is odd. You may assume that the argument is a valid integer value.

# Examples:


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# Solution
# def is_odd?(number)
#   number % 2 == 1
# end
# Discussion
# To determine if a number is odd without using #odd? or #even?, we must check whether the number modulo 2 is 1. In Ruby, we use % to perform modulo operations, so we use it here to determine whether the number is odd.

# Further Exploration
# This solution relies on the fact that % is the modulo operator in Ruby, not a remainder operator as in some other languages. Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the number on the right is positive.

# modulo	remainder
# 5 mod 2 == 1	5 rem 2 == 1
# -5 mod 2 == 1	-5 rem 2 == -1
# 5 mod -2 == -1	5 rem -2 == 1
# -5 mod -2 == -1	-5 rem -2 == -1
# If you weren't certain whether % were the modulo or remainder operator, how would you rewrite #is_odd? so it worked regardless?

# The Integer#remainder method performs a remainder operation in Ruby. Rewrite #is_odd? to use Integer#remainder instead of %. Note: before version 2.4, Ruby used the Numeric#remainder method instead.

# Further Exploration
# def is_odd_refactored?(integer)
#   integer.remainder(2).abs == 1 # absolute value of #remainder method's return is compared to ensure non-negative comparison
# end