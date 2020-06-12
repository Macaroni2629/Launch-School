array = [1, 2, 3]

array.each do |element|
    a = element
end

puts a

=begin

We will now get an exception when the puts method is invoked with the local variable a.
This is because the local variable a is not defined in this scope.

=end