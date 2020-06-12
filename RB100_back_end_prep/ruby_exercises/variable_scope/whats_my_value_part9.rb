a = 7

array = [1, 2, 3]

array.each do |a|
    a += 1
end

puts a

=begin
The output will be 7.
This is because of shadowing.  Shadowing occurs when a block argument hides
a local variable that is defined outside the block.

The Array#each method looks for the variable a within the block first.
Since it found that first, then it ignores the local variable a initialized outside the block.

=end