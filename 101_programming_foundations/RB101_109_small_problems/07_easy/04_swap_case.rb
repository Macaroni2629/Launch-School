# Swap Case
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

def swapcase(string)
  string.each_char.map do |char|
    if char == char.upcase
      char.downcase
    else
      char.upcase
    end
  end.join
end

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

def swapcase(string)
  chars_ary = string.chars.map do |char|
    char == char.downcase ? char.upcase : char.downcase
  end
  chars_ary.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'