def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

# The method `count_sheep` will print 0, 1, 2, 3, 4, 10 because the Integer#times
# method will count from 0 to one less than the integer entered.
# Then, the method 'count_sheep' will return the number 10 because it is
# the last line of the method.  10 is the implicit return value of the method.
