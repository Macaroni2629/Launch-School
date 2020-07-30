def prompt(message)
  puts "==> #{message}"
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end

loop do
  prompt("Welcome to the Loan Calculator!")

  loan_amount = ''
  loop do
    prompt("What is the loan amount?")
    loan_amount = gets.chomp

    if loan_amount == '0'
      prompt("That's not valid.  Please enter again.")
    elsif number?(loan_amount)
      break
    else
      prompt("That's not a valid amount.  Please try again.")
    end
  end

  loan_amount = loan_amount.to_i

  apr = ''
  loop do
    prompt("What is the annual percentage rate for this loan?
      Please write a whole number (example 10 for 10%)")
      apr = gets.chomp

      if apr == '0'
        prompt("That's not a valid monetary amount.  Please try again.")
      elsif number?(apr)
        break
      else
        prompt("That's not a valid monetary amount.  Please try again.")
      end
    end

  year_duration = nil
  
  loop do
    prompt("What is the loan duration in  years?")
    year_duration = gets.chomp

    if year_duration == '0'
      prompt("That's not a valid monetary amount.  Please try again.")
    elsif number?(year_duration)
      break
    else
      prompt("That's not a valid monetary amount.  Please try again.")
    end
  end

  month_duration = year_duration.to_i * 12

  monthly_rate = (apr.to_f / 12) / 100

  monthly_payment = loan_amount * (monthly_rate / (1 -
    (1 + monthly_rate)**(-month_duration)))

  prompt("For #{month_duration} months, you will need to pay
        $#{monthly_payment.ceil(2)} each month, at an interest
        rate of #{monthly_rate.ceil(2)}% a month.")

  prompt("Would you like to do another calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for using the Loan Calculator!")