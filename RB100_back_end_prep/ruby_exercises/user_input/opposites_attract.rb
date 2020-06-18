def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
input1 = nil
input2 = nil

def input
  loop do
    puts "Please enter a positive or negative integer"
    input = gets.chomp
    break if valid_number?(input)
    puts "Invalid input. Only non-zero integers are allowed."
  end
end

loop do
    input1 = input
    input2 = input   

    if input1.to_i * input2.to_i < 0
        result = input1.to_i + input2.to_i
        puts "#{result}"
        break
    else  
        puts "Invalid input"
    end
end