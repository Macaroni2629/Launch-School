['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# if a block is given, count method counts the number of elements for which the block returns a true value

# count only counts an element if the block's return value evaluates to true.