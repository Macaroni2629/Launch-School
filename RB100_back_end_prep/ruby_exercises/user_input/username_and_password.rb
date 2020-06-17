USERNAME = 'admin'
PASSWORD = 'SecreT'

loop do
  puts "Please enter a username."
  input = gets.chomp
  puts "Please enter your password."
  input2 = gets.chomp
  break if input == USERNAME && input2 == PASSWORD
  puts "Authorization failed!"
end

puts "Welcome!"