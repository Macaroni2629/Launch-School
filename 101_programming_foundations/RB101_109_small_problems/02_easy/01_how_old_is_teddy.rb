# How old is Teddy?
# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example Output


# Teddy is 69 years old!

# age = rand(20..200)
# puts "Teddy is #{age} years old!"



# Discussion
# Our solution uses Kernel#rand with a range (20..200) as an argument. This use is described in the documentation for rand, although it is kind of an afterthought.

# Nevertheless, the use of a range to limit the output value is an enormous help here, so we use it to generate Teddy's age. Afterward, all we have to do is print the result.

# Further Exploration
# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

puts "Please type your name."
name = gets.chomp
if name.empty?
    name = "Teddy"
end
puts "#{name} is #{rand(20..200)} years old!"