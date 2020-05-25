# '4' == 4 ? puts("TRUE") : puts("FALSE")
# outputs false because a string does not equal an integer.  It is a ternary operator.

=begin
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
    puts "Did you get it right?"
else
    puts "Did you?"
end
=end
# outputs "Did you get it right?" because 3 equals 3

=begin
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
=end

# outputs "Alrighty!" because 11 equals 10 equals 10
