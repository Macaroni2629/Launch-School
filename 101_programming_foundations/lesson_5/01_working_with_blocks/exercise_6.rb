[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

=begin
  
The Array#select method is called on the object [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].  Each element of the
array, a hash, is passed to the block in turn and assigned to the local variable hash.

The all? method is called on the hash.  Each key value pair is passed to the block and assigned the variables key, value
respectively.

Select method caries about the truthiness of the block's return value, using a method that returns a boolean works well.
All method will return true if the block passed to it NEVER returns a value of false or nil for every key/value pair in the hash.
We're using value[0] == key.to_s to test whether all keys match the first letter of all their associated values.

The only hash that meets this criteria is {:c => 'cat'}, and the return value is an array.

# => [{ :c => "cat" }]
=end