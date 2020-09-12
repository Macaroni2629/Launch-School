=begin

Ben was tasked to write a simple ruby method to determine if an input string 
is an IP address representing dot-separated numbers. e.g. "10.4.5.11". 
He is not familiar with regular expressions. Alyssa supplied Ben with a 
method called is_an_ip_number? that determines if a string is a numeric string 
between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
Alyssa reviewed Ben's code and says "It's a good start, but you missed a few 
things. You're not returning a false condition, and you're not handling the 
case that there are more or fewer than 4 components to the IP address (e.g. 
  "4.5.5" or "1.2.3.4.5" should be invalid)."

  def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true

  you need the lines "return false unless dot_separated_words.size == 4 because the size of the IP address
  cannot contain more or less than 4 numeric strings.
  
  Also, you need the line "return false unless is_an_ip_number?(word) because you need a way to
  break out of the loop.  The purpose of the loop is to make sure that every word is a numeric string
  between 0 and 255.  You want to BREAK the method by returning false when the word is NOT a numeric
  string between 0 and 255.
end

  =end