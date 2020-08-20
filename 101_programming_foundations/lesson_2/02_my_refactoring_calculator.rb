=begin
Refactoring Calculator Problem

Algorithm
Ask user for one integer
  Validate
    Use a loop to validate

Ask user for second integer
  Validate
    Use a loop to validate

Ask user for operation
  Validate operation
  
Do Calculation

Ask if they want to do another calculation.


=end

def prompt(msg)
  puts("=>#{msg}")
end

def get_user_input
  gets.chomp
end

def valid_number?(number)
  number.to_i.to_s == number
end

def valid_operation?(operation)
  %w[1 2 3 4].include?(operation)
end

def operation_to_message(operation)
  case operation
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end


def get_num_and_validate
  loop do
    prompt("Please input a number.")
    number = get_user_input
    return number if valid_number?(number)
    prompt("Invalid input.  Please enter an integer.")
  end
end

def get_op_and_validate
  
  operator_prompt = <<-MSG
Please input an operation.  
1 for addition
2 for subtraction
3 for multiplication
4 for division
MSG
  
  loop do
    prompt(operator_prompt)
    operation = get_user_input
    return operation if valid_operation?(operation)
    prompt("Invalid input.")
  end
end

loop do
  number1 = get_num_and_validate
  number2 = get_num_and_validate
  operation = get_op_and_validate

  prompt("#{operation_to_message(operation)} the two numbers..") 
  result = case operation
           when '1'
            number1.to_i + number2.to_i
           when '2'
            number1.to_i - number2.to_i
           when '3'
            number1.to_i * number2.to_i
           when '4'
            number1.to_f / number2.to_f
  end

  prompt("The result is #{result}.")
  prompt("Do you want to do another calculation.  Type 'y' for yes.  Anything else will leave the calculator.")

  answer = gets.chomp
  break unless answer.downcase == 'y'
end
      
prompt("Thank you for using the calculator.  Goodbye!")