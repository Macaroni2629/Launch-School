puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

if number < 0
    puts "You can't enter a negative number."
elsif number <= 50
    puts "You entered the number #{number}, which is between 0 and 50."
elsif number <= 100
    puts "You entered the number #{number}, which is between 51 and 100"
else
    puts "You entered the number #{number}, which is greater than 100."
end