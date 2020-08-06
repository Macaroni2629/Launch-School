WINNING_SCORE = 5

VALID_CHOICES = {
  "r" => "rock",
  "p" => "paper",
  "sc" => "scissors",
  "l" => "lizard",
  "sp" => "spock"
}

VALID_CHOICES_MESSAGE = <<-MSG
Please Enter:
  'r' for Rock
  'p' for Paper
  'sc' for Scissors
  'l' for Lizard
  'sp' for Spock
  MSG

WINNING_SCENARIOS = {
  "rock" => ["lizard", "scissors"],
  "paper" => ["rock", "spock"],
  "scissors" => ["lizard", "paper"],
  "lizard" => ["spock", "paper"]
  "spock" => ["rock", "scissors"]
}

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_SCENARIOS[first].include?(second)
end

def update_score_board(player, computer, score_board)
  if win?(player, computer)
    score_board[:player] += 1
  elsif win?(computer, player)
    score_board[:computer] += 1
  end
end

def reset_score_board(score_board)
  score_board[:computer] = 0
  score_board[:player] = 0
end

def display_score_board(score_board)
  "Your score: #{score_board[:player]}.
  Computer score: #{score_board[:computer]}."
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def match_ended?(score_board)
  score_board[:player] == WIN_SCORE || score_board[:computer] == WIN_SCORE
end

def display_match_winner(score_board)
  if score_board[:player] == WIN_SCORE
    "Congrats!  You won #{WIN_SCORE} matches, you are the winner!"
  elsif score_board[:computer] == WIN_SCORE
    "Congrats!  Computer won #{WIN_SCORE} matches, Computer is the winner!"
  end
end

def display_choice_options
  "Choose one:
  'r' for rock,
  'p' for paper,
  'sc' for scissors,
  'sp' for spock,
  'l' for lizard"
end

def display_rules
  <<-INTRO
  Welcome to the game of Rock, Paper, Scissors, Spock, Lizard!
  The rules are:
  Rock crushes Lizard and crushes Scissors.
  Paper covers Rock and disproves Spock.
  Scissors cut Paper and decapitates Lizard.
  Spock smashes Scissors and vaporizes Rock.
  Lizard poisons Spock and eats Paper.

  You must win #{WIN_SCORE} matches to win the entire game.
  INTRO
end

def clear_screen
  system('clear')
end

prompt(display_rules)

loop do
  loop do
    choice = ''

    loop do
      prompt(display_choice_options)
      choice = gets.chomp.downcase

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
        sleep(2)
        clear_screen
      end
    end

    computer_choice = VALID_CHOICES.sample
    
    puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    prompt(display_results(choice, computer_choice))

    update_score_board(choice, computer_choice, score_board)

    prompt(display_score_board(score_board))

    sleep(2)
    clear_screen
    
    if match_ended?(score_board)
      prompt(display_match_winner(score_board))
      reset_score_board(score_board)
      break
    end
  end
  prompt("Do you want to play again?"  Enter Y/y to play again.  Enter anything else to exit.")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
  
end

prompt("Thank you for playing.  Good bye!")


