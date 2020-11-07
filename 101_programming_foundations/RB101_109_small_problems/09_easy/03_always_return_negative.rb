# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

# Examples:

def negative(number)
  if number.positive?
    return -(number)
  elsif number.negative?
    return number
  elsif number.zero?
    return 0
  end
end

def negative(number)
  number > 0 ? -number : number
end

def negative(number)
  -number.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby