# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# Examples

def letter_case_count(string)
  array_of_chars = string.chars
  
  result = { :uppercase => 0, :lowercase => 0, :neither => 0 }
  
  array_of_chars.each do |char|
    if char =~ /[a-zA-Z]/
      if char == char.upcase
        result[:uppercase] += 1
      else 
        result[:lowercase] += 1
      end
    else
      result[:neither] += 1
    end
  end
  
  result
  
  
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

# Discussion
# This method is expected to return a hash of character counts.

# In the first solution, we begin by initializing two constants containing the uppercase and lowercase letters of the alphabet. Then, after initializing a counts hash with the appropriate keys and default values of zero, we simply iterate over each character of the string passed in as an argument and update each count as needed.

# We take a different approach in our second solution. We first initialize an empty counts hash and then use Array#count to find the number of occurrences of lowercase, uppercase, and all other characters. In the block following the count method invocation, we use the String#=~ method to match each character of the string against a pattern specified by a regular expression. The block will return a truthy value if there is a match, nil otherwise.

# In the second solution, we use regular expressions to count certain types of characters. We'll explain things a bit here for those who aren't familiar with regex:

# char =~ /[a-z]/ : This checks if the character is a lowercase letter between a and z. char =~ /[A-Z]/ : This checks if the character is an uppercase letter between A and Z. char =~ /[^A-Za-z]/ : This checks if the character is neither an uppercase letter nor a lowercase letter.

# For more information on regex, see our book, Introduction to Regular Expressions. We'll ask you to read the book later, but you can skim it at any time.


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }