a = 7

def my_value(b)
    b = a + a
end

my_value(a)

puts a

=begin
 We get an error message, stating that there is an undefined local variable 
 or method 'a' because 'a', while defined outside the method, is not defined
 inside the method my_value.  

 My_value method raises an exception, and the program stops running.

 =end
