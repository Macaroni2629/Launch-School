[1, 2, 3].any? do |num|
  puts num
  num.odd?
end


# => true
# The return value of the block is determined by the return value of the last expression within the block.

# In this case, the last statement evaluated is num.odd?, which returns a boolean.  Therefore,
# the block's return value will be a boolean since Integer#odd? can only return true or false.

#Since the Array#any? method returns true if the block EVER returns a value other than false or nil,
#and the block returns true on the first iteration, we know that any? will return true.

#Any? stops iterating after this point since there is no need to evaluate the remaining items in the array.