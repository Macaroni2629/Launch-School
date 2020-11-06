# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to casp e; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:

=begin
Algorithm

Find all substrings

check if each substrings equals itself reversed


=end

def find_substrings(string)
  result = []
  
  0.upto(string.length - 1) do |index|
    2.upto(string.length - index) do |length|
      result << string[index, length]
    end
  end
  
  result 
end

def palindromes(string)
  substrings = find_substrings(string)
  
  result = []
  
  substrings.each do |substring|
    result << substring if substring == substring.reverse
  end
  result
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == 
[
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == 
[
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

def substrings(str)
  substrings_arr = []
  0.upto(str.length - 1) do |idx|
    1.upto(str.length - idx) do |length|
      substrings_arr << str[idx, length]
    end
  end
  substrings_arr
end

def palindromes(str)
  substrings(str).each_with_object([]) do |sub_str, arr|
    arr << sub_str if palindrome?(sub_str)
  end
end

def palindrome?(str)
  str == str.reverse && str.length > 1
end

# Further Exploration I just modified the palindrome? method to make all characters lowercase, and remove non-alphanumeric characters

def palindrome?(str)
  str = str.downcase.gsub(/\W/, '')
  str == str.reverse && str.length > 1
end