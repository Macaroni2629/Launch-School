a = 7

array = [1, 2, 3]

array.each do |element|
    a = element
end

puts a

=begin
puts a will output 3 because this question is talking about block local variable inners coping rules.
a is first initialized on line 1.  Local variable a is accessed when the Array#each method is invoked
upon object array.  1, 2, 3, are each passed to block local variable element.
3 is the last block local variable assignment.  Therefore, a = 3 at the end of the iteration.

Thus, the answer is 3.

=end