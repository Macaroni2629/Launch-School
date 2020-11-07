# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# Examples

def swap_name(string)
  array_of_words = string.split
  
  array_of_words[-1] + ", " + array_of_words[0]
end

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'