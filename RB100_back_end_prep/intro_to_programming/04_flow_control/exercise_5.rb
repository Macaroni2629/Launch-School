def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

# this gets an error because there's only one "end," which matches with the if...else statement.
# It needs another end for the method definition.