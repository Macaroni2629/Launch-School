loop do
  puts "Please enter a username."
  input = gets.chomp
  puts "Please enter your password."
  input2 = gets.chomp
  break if input == "admin" && input2 == "SecreT"
  puts "Authorization failed!"
end

puts "Welcome!"