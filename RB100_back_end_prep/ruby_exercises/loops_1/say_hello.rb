# Modify the code below so "Hello!" is printed 5 times.

say_hello = true
count = 0

while say_hello
    puts 'Hello!'
    count += 1
    say_hello = false if count == 5
end


# You need a count to increment and count the number of iterations.
# You need to set say_hello = false if/when count == 5 in order to break the loop.