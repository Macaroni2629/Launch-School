=begin
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

When you initialize a local variable within an if block, even if that 
if block doesn’t get executed, the local variable is initialized to nil

=end
