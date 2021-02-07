Question 1
If we have this code:

Copy Code
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
What happens in each of the following cases:

case 1:

Copy Code
hello = Hello.new
hello.hi
case 2:

Copy Code
hello = Hello.new
hello.bye
case 3:

Copy Code
hello = Hello.new
hello.greet
case 4:

Copy Code
hello = Hello.new
hello.greet("Goodbye")
case 5:

Copy Code
Hello.hi

  
case 1

"Hello" is printed to the terminal.

case 2

An undefined method error occurs. Neither the Hello class nor its parent class Greeting have a bye method defined.

case 3

An ArgumentError reporting a wrong number of arguments is returned. The Hello class can access its parent class's greet method, but greet takes an argument which is not being supplied if we just call greet by itself.

case 4

"Goodbye" is printed to the terminal.

case 5

An undefined method hi is reported for the Hello class. This is because the hi method is defined for instances of the Hello class, rather than on the class itself. Since we are attempting to call hi on the Hello class rather than an instance of the class, Ruby cannot find the method on the class definition.

