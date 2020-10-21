# String Assignment
# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name
# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:


name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# What does this print out? Can you explain these results?

# Because assignment in ruby just assigns a reference to a variable, both name and save_name refer to the same string, Bob. When you apply name.upcase!, which mutates name in place, the value that save_name references also changes. Thus, both name and save_name are set equal to 'BOB'.

