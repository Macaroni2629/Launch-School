# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

statement = statement.delete(" ")

letter_count = Hash.new(0)

statement.each_char do |char|
  letter_count[char] += 1
end

p letter_count