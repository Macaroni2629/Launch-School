# Leading Substrings
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# Examples:


def find_substrings(string)
  result = []
  0.upto(0) do |index|
    1.upto(string.length - index) do |length|
      result << string[index, length]
    end
  end
  result
end


def leading_substrings(string)
  all_substrings = find_substrings(string)
end

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']