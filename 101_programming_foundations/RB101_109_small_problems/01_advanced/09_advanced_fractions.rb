# Egyptian Fractions
# A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15

# Every positive rational number can be written as an Egyptian fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6

# Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.
    
p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
end

# Discussion
# We use the Rational class for this problem to avoid precision problems with floating point representations. Had we tried this problem using floating point numbers, we could easily get incorrect results, or even an infinite loop. The Rational number class avoids this by using an exact representation for rational numbers.

# Our approach to this problem starts with the target value, numerator / denominator, and a unit fraction of 1 / 1. If 1 / 1 can be subtracted from the target value without producing a negative result, then we have one of the unit fractions we need, and add the denominator to our results list. We also subtract the unit fraction from our target value. Next, we do the same thing with 1 / 2, then 1 / 3, and so on, until our target value is reduced to exactly 0. At this point, we have one of the possible Egyptian Fraction representations of our original number.

# Reversing this process is straightforward: we simply use Enumerable#inject to add up all of the unit fractions.

#coding session with Natalie

# Egyptian Fractions
# A Rational Number is any number that can be represented as the result of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The number to the left is called the numerator, and the number to the right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15

# Every positive rational number can be written as an Egyptian fraction. For example:


#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6

# Write two methods: one that takes a Rational number as an argument, and returns an Array of the denominators that are part of an Egyptian Fraction representation of the number, 

#and another that takes an Array of numbers in the same format, and calculates the resulting Rational number. You will need to use the Rational class provided by Ruby.

def egyptian(ration)
  numerator = ration.numerator
  denominator = ration.denominator
  
  ar = []
  counter = 1
  total = 0
  
  loop do
    temp_tot = total
   
    temp_tot += denominator.to_f / counter 

    if temp_tot <= numerator

      ar << counter

      total = temp_tot

    end
    
    return ar if total == numerator

    counter += 1
  end
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p egyptian(Rational(1, 2))

def unegyptian(array_of_integers)
  counter = 1
  
  loop do
    sum_array = []
    
    array_of_integers.each do |num|
      sum_array << counter / num.to_f
    end
    
    if sum_array.sum.to_i == sum_array.sum
      return Rational(sum_array.sum, counter) ### counter sum_array.sum
    end
    
    counter += 1
  end
  
end
    
p unegyptian([2])
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

def egyptian(target_value)
  denominators = []
  unit_denominator = 1
  until target_value == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= target_value
      target_value -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) do |accum, denominator|
    accum + Rational(1, denominator)
  end
end


=begin
input: rational
output: array of integers
- The array should be the denominators that go into the number passed in
Rational Number: any number above 0
numberator - top
denominator - bottom


input: array of integers
output: rational 

rational(numerator, denominator)

=end