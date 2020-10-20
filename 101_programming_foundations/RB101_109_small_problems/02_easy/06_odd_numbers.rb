# Odd Numbers
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
  
(0..99).each do |num|
  puts num if num.odd?
end

value = 1
while value <= 99
  puts value
  value += 2
end

1.step(99, 2) { |x| puts x}