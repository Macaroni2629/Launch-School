a = 7

def my_value(b)
    a = begin
end

my_value(a + 5)

puts a

# the answer is 7 because the local variable 'a' inside the 'my_value' method is not visible outside the method.