{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# The return value of map is an array. [nil, 'bear']

# Ant is not a value greater than 3, which means the if condition evaluates to false.  Since false is NOT equal to true
# the if statement returns nil.  Bear value is a value with a size greater than 3, so it is returned in return value of map.
