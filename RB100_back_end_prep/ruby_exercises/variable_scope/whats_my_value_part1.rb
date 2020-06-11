a = 7

def my_value(b)
    b += 10 # b = b + 10, b = 17
end

my_value(a)

puts a

=begin

7

'a' will still be assigned to 7 because numbers are immutable.  When 'a'
is passed in as an argument to parameter 'b', then 7 is passed in.
7 cannot be changed because it is a constant.  Line 4 binds 'b' to a new object.
The object pointed to by 'a' remains unchanged.

=end