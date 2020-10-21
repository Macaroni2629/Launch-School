# Searching 101
# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

NAMES = %w[1st 2nd 3rd 4th 5th last]

def six_numbers
  counter = 0
  array = []
  while array.size < 5
    puts "Enter the #{NAMES[counter]} number:"
    number = gets.chomp.to_i
    array << number
    counter += 1
  end
  puts "Enter the #{NAMES.last} number:"
  sixth_number = gets.chomp.to_i
  
  if array.include?(sixth_number)
    puts "The number #{sixth_number} appears in #{array}."
  else
    puts "The number #{sixth_number} does not appear in #{array}."
  end
end

six_numbers

