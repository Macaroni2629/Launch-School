def twice(number)
  
  array_of_numbers = number.digits.reverse
  
  
  half_index = array_of_numbers.size.to_f / 2 - 1 if array_of_numbers.size.even?
  
  
  half_index = array_of_numbers.size.to_f / 2 if array_of_numbers.size.odd?
  
  
  first_half = array_of_numbers[0..half_index]
  
  second_half = array_of_numbers[half_index + 1..-1]
  
  if first_half == second_half
    return number
  else
    return number * 2
  end
  
end