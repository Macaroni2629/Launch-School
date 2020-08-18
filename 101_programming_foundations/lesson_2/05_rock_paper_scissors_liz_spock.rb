VALID_CHOICES = %w[r p sc l sp]
WIN_CONDITIONS = { 'r' => ["l", "sc"],
                   'p'=>  ["r", "sp"],
                   'sc'=> ["p", "l"],
                   'l'=> ["p", "sp"],
                   'sp'=> ["sc", "r"]
                  }

WINNING_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

def valid_choice?(user_choice)
  VALID_CHOICES.include?(user_choice)
end

def get_user_choice
  loop do
    prompt("Please enter r for rock, p for paper, l for lizard, sc for scissors, or sp for spock.")
    user_choice = gets.chomp
    return user_choice if valid_choice?(user_choice)
    prompt("invalid choice.  please enter a valid choice.")
  end
end

def get_computer_choice
  VALID_CHOICES.sample
end

def who_won(first, second)
  if WIN_CONDITIONS[first].include?(second)
    prompt("User wins!")
  elsif WIN_CONDITIONS[second].include?(first)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end


score_board = {
     user: 0,
     computer: 0
   }
def update_score(score_board, user_choice, computer_choice)
  score_board[:user] += 1 if WIN_CONDITIONS[user_choice].include?(computer_choice)
    score_board[:computer] += 1 if WIN_CONDITIONS[computer_choice].include?(user_choice)
end

loop do
  prompt("Welcome to rock paper scissors lizard spock.")
  user_choice = get_user_choice
  prompt("You picked #{user_choice}.")
  computer_choice = get_computer_choice
  prompt("Computer chose #{computer_choice}.")
  winner_of_round = who_won(user_choice, computer_choice)
  current_score = update_score(score_board, user_choice, computer_choice)
  break if score_board[:user] == WINNING_SCORE || score_board[:computer] == WINNING_SCORE
  p score_board
end