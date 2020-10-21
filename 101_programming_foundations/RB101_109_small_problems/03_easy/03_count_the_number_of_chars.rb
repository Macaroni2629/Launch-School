# Counting the Number of Characters
# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# input:

# Please write word or multiple words: walk
# output:

# There are 4 characters in "walk".
# input:

# Please write word or multiple words: walk, don't run
# output:

# There are 13 characters in "walk, don't run".

def count_chars
  puts "Please write word or multiple words"
  word = gets.chomp
  word_count = word.delete(" ").size
  
  puts "There are #{word_count} characters in '#{word}.'"
end

count_chars

print 'Please write word or multiple words: '
input = gets.chomp
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."

Note the use of the back slash to indicate that the quotes are for alpha characters NOT for puts method.