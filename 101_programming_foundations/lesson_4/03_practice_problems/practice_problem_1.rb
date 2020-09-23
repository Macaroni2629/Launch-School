[1, 2, 3].select do |num|
  num > 5
  'hi'
end

#The select method will return [1, 2, 3] because the block's return value is 'hi', which is a strong, and string objects
#have truthy values. 