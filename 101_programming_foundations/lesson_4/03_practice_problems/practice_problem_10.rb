[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]

# For the first element, the if condition evaluates to false, which means 1 is the return value for that iteration.
# for the rest of the elements, they evaluate to true in the if conditional, so puts num is the last statement evaluated.
# Which means nil is the return value of those iterations because the return value of puts is nil.