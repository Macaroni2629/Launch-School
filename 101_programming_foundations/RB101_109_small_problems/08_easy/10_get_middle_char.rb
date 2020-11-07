# Get The Middle Character
# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

# Examples:

def center_of(string)
  result = []
  string.each_char do |char|
    result << char
  end
  
  middle = result.size.to_f / 2
  
  if result.size.odd?
    return result[middle]
  else
    return result[middle - 1] + result[middle]
  end
end

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end


p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') #== 'x'