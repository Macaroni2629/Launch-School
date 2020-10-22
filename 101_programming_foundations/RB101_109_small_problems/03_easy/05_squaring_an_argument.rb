# Squaring an Argument
# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Example:

def multiply(a, b)
  a * b
end

def square(n)
    multiply(n, n)
end

def power_of_n(power, n)
  product = 1
  power.times {product = multiply(n, product)}
  product
end

puts square(3)
puts power_of_n(3, 2)