# Multiples of 3 and 5
# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

=begin

Initialize an empty array called multiples = []
List number range from 0 to integer given, and iterate number by number
  If the number % 3 == 0
    Shovel number into `multiples`
  If the number % 5 == 0
    Shove number into `multiples
    
Sum results array


=end

# Examples

# def multisum(number)
#   multiples = []
  
#   (1..number).each do |num|
#     if num % 3 == 0
#       multiples << num
#     elsif num % 5 == 0
#       multiples << num
#     end
#   end
#   multiples.sum
  
# end


# def multisum(number)
#   result = 0
  
#   (1..number).each do |num|
#     if num % 3 == 0
#       result += num
#     elsif num % 5 == 0
#       result += num
#     end
#   end
#   result
# end

def multisum(int)
  multiples_array = []

  (1..int).each do |n|
    multiples_array << n if n % 3 == 0 || n % 5 == 0
  end

  multiples_array.sum
end

def multisum(int)
  result = (1..int).select do |n|
    n if n % 3 == 0 || n % 5 == 0
  end

  result.sum
end

def multisum(int)
  (1..int).select do |n|
    n if n % 3 == 0 || n % 5 == 0
  end.inject(:+)
end

p multisum(20) #== 98
p multisum(3) #== 3
p multisum(5) #== 8
p multisum(10) #== 33
p multisum(1000) #== 234168

Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succinct?
def multisum(int)
  (1..int).reduce(0) do |sum, n|
    n % 3 == 0 || n % 5 == 0 ? sum + n : sum
  end
end