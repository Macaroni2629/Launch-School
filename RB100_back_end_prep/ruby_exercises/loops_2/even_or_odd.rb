count = 1

loop do
  puts "#{count} is odd!" if count.odd?
  puts "#{count} is even!" if count.even?
  break if count == 5  
  count += 1
end

# You need a count to increment until the number 5 is outputted.