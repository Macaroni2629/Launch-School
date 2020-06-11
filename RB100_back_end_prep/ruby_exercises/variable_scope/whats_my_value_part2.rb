a = 7

def my_value(a)
    a += 10
end

my_value(a)

puts a

# the answer is 7 because method definitions are self contained with respect to local variables.
# Local variables outside the method definition are not visible inside the method definition.
