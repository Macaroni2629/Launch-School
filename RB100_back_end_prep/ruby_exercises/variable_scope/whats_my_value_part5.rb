a = "Xyzzy"

def my_value(b)
    b = 'yzzyX'
end

my_value(a)
puts a

=begin
   'a' will output "Xyzzy" because is a local variable outside the method definition.
   The my_value method in this problem first passes in 'a' as an argument to my_value,
   first re-assigning 'b' to 'yzzyX'.  Then, the next line of code, 'b' is reassigned back
   to 'yzzyX.'  'a' has not been mutated at all throughout this process. 
=end