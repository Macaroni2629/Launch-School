# Tip calculator
# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def tip_calc
  puts "What is the bill?"
  bill = gets.chomp.to_f
  
  puts "What is the tip percentage?"
  tip_perc = gets.chomp.to_f
  tip_perc = (tip_perc / 100).round(2)
  
  tip = bill * tip_perc
  
  total = bill + tip
  
  puts "The tip is $#{tip}."
  puts "The total is $#{total}."
  
end


tip_calc

def prompt(text)
  puts ">> " + text
end

def calculate_tip(bill, rate)
  (bill * (rate / 100))
end

prompt("Enter bill amount:")
bill_amount = gets.to_f

prompt("Enter tip rate:")
tip_rate = gets.to_f

tip = calculate_tip(bill_amount, tip_rate)

puts "The tip is #{format("$%.2f", tip)}"
puts "The total is #{format("$%.2f", (bill_amount + tip))}"