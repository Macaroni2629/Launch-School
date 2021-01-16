# What is a module? What is its purpose? How do we 
#   use them with our classes? Create a module for the
#    class you created in exercise 1 and include it properly.

# A module allows us to group reusable code into one place. 
# We use modules in our classes by using the include method invocation, 
# followed by the module name. Modules are also used as a namespace.

module Study
end

class MyClass
  include Study
end

my_obj = MyClass.new