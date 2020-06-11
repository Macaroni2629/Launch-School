a = "Xyzzy"

def my_value(b)
    b[2] = '-'
end

my_value(a)

puts a

# the answer is "Xy-Zy" because strings are mutable, unlike numbers.
# String#[] is a mutating method, so both 'a' and 'b' point to the mutated string now.
