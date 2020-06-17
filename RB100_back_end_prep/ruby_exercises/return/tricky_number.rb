def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

# The return value of 'tricky_number' is 1 because line 2 states, 'if true'.
# By definition, line 2 will always be true.
# The 'tricky_number' method returns the variable assignment, which is 1.
