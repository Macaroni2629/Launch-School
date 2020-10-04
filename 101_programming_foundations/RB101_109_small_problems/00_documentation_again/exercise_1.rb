# Locate the ruby documentation for methods File::path and File#path. How are they different?

# File:: path is a class method, while File#path is an instance method.

=begin 
Class methods are called on the class, while instance methods are called on objects.
Example of Class method:

puts File.path('bin')

Here, we are calling it on the File class, while:

f = File.new('my-file.txt')
puts f.path

calls the instance method File#path since we're calling it on an object of the File class, namely f.


