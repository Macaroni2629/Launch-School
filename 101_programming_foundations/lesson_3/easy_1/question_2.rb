# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# what is != and where should you use it?
# put ! before something, like !user_name
# put ! after something, like words.uniq!
# put ? before something
# put ? after something
# put !! before something, like !!user_name

=begin
  
what is != and where should you use it? This is not equals.  You use it when you're looking for something not equal to something.
put ! before something, like !user_name.  This means you're looking for something that's not the object following the bang.
put ! after something, like words.uniq!  This means you're usually turning the method from a non-mutating method to a mutating method.
put ? before something  This means you're probably using the ? as a ternary operator.
put ? after something  This means you're asking for a boolean return value, true or false.
put !! before something, like !!user_name  This means to turn any object into its boolean equivalent.
! is to turn any object into the opposite of their boolean equivalent.

=end
