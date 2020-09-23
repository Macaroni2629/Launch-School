[1, 2, 3].reject do |num|
  puts num
end

# the return value is [1, 2, 3]
#reject returns a new array containing items where the block's return value is 'falsey'.  
# (Puts returns nil here)
#If the return value was false or nil, the item would be selected.