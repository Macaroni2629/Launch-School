=begin
  
To drive that last one home...let's turn the tables and have the string show
 a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

When you pass in references to the string and the array, if you shovel to the string, the string will get mutated.
The local variable an_array_param inside the method is not the same as the one inside the method.  

Thus, when you puts the string interpolation on line 16, that's passing in the local variable my_array outside the method,
which has not been mutated.
  
=end