a = 7

array = [1, 2, 3]

def my_value(ary)

    ary.each do |b|
        a += b
    end
end

my_value(array)

puts a

=begin
This method returns an exception because although there is an invocation of the 'each' method with a block,
that invocation of the 'each' method with a block is inside a method definition.  Thus, 'a' within the iterative method invocation
does not have access to the local variable initialized outside the method definition.
=end

