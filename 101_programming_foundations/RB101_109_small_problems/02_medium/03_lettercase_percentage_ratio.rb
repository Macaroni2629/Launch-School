# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples

=begin

Initialize an empty hash called `hash_count` with the keys lowercase, uppercase, and neither.

Iterate through each character, letter by letter.
  Check if it is an uppercase letter
    If so, increase the hash count by 1 for key uppercase
  Check if it is a lowercase letter
    If so, increase the hash count by 1 for key lowercase
  Else
    Increase the hsah count by 1 for the key neither
    
Initialize a new hash called `final_percentage` with the keys lowercase, uppercase, and neither.

  Set the value of `final_percentage` hash equal to the percentage ratio relative to the other keys


=end

def letter_percentages(string)
  hash_count = { :lowercase => 0, :uppercase => 0, :neither => 0 }
  
  string.each_char do |char|
    if char =~ /[A-Z]/
      hash_count[:uppercase] += 1
    elsif char =~ /[a-z]/
      hash_count[:lowercase] += 1
    else
      hash_count[:neither] += 1
    end
  end
  
  total_count = hash_count.values.sum
  
  final_percentage = {:lowercase => 0, :uppercase => 0, :neither => 0 }
  
  
  
  hash_count.each do |key, value|
    final_percentage[key] = value.to_f / total_count.to_f
  end
  
  final_percentage.each do |key, value|
    final_percentage[key] = value * 100
  end
  
  final_percentage
end

def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
  
p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }