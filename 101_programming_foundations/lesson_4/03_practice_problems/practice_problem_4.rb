['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { "a" => "ant", "b" => "bear", "c" => "cat" }

# When we invoke each_with_object method, we pass in a hash object {} as an argument.  That object
# is then passed into the block and its updated value is returned at the end of each iteration.

# Once each_with_object has iterated over the calling collection, it returns the initially given object,
# which now contains all of the updates.