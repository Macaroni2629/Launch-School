# ASCII String Value
# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(word)
  sum = 0
  word.each_char do |letter|
    sum += letter.ord
  end
  sum
  
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Further Exploration
# There is an Integer method such that:

# char.ord.mystery == char
# where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

def ascii_value(string)
  string.chars.inject(0) { |sum, char| sum + char.ord }
end

# Further Exploration
char = 'a'
puts char.ord.chr == char

# will not work on strings longer than a single character because #ord
# only works on a one character string and will ignore the rest of the
# string called by it
