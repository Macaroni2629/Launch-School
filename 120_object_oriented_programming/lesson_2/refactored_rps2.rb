# Add a class for each move

# What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

def clear_screen
  system 'clear'
end

class Move
  attr_reader :beats, :name
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  
  def to_s
    self.class.to_s 
  end  
  
  def >(other_move)
    other_move.name == @beats[0] || other_move.name == @beats[1]
  end
end

class Rock < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["scissors", "lizard"]
  end
end

class Paper < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["rock", "spock"]
  end
  
  # def >(other_move)
  #   other_move.name == "rock" || other_move.name == "spock"
  # end
end

class Scissors < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["paper", "lizard"]
  end
  
  # def >(other_move)
  #   other_move.name == "paper" || other_move.name == "lizard"
  # end
end

class Lizard < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["spock", "paper"]
  end
  
  # def >(other_move)
  #   other_move.name == "spock" || other_move.name == "paper"
  # end
end

class Spock < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["rock", "scissors"]
  end
  
  # def >(other_move)
  #   other_move.name == "rock" || other_move.name == "scissors"
  # end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name 
    @score = 0
  end
end

class Human < Player
  def set_name
      n = ''
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
  end

  def choose
    clear_screen
    sleep(3)
    choice = nil
      loop do
        puts "Please choose rock, paper, scissors, lizard, or spock:"
        choice = gets.chomp
        break if Move::VALUES.include? choice
        puts "Sorry, invalid choice."
      end
      self.move = Move.const_get(choice.capitalize).new #causes Move to look for a class named such and such and turns it into a Class if it's found
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = [Rock, Paper, Scissors, Lizard, Spock].sample.new
  end
end
#Game Orchestration Engine
class RPSGame
  WINNING_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
    sleep(3)
    clear_screen
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, and Spock!  Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif computer.move > human.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end
  
  def display_score
    puts "Score:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end


  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again?  (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y o n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end
  
  def check_winner
    if human.score == WINNING_SCORE
      return true
    elsif computer.score == WINNING_SCORE
      return true
    end
    
    false
  end
  
  def display_grand_winner
    if human.score > computer.score
      puts "#{human.name} wins with #{human.score} wins!"
    elsif computer.score > human.score
      puts "#{computer.name} wins with #{computer.score} wins!"
    else
      puts "The game ended in a tie with both #{human.name} and #{computer.name} having won #{human.score} wins!"
    end
  end


  def play
    loop do
      
      display_welcome_message

      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_score
        break if check_winner
        break unless play_again?
      end
      clear_screen
      sleep(2)
      display_grand_winner
      if !play_again?
        break display_goodbye_message
      elsif play_again?
        next
      end
    end
    end
end

RPSGame.new.play

# 1) Add clear screens

# 2) Abstract away human and computer choices into one method?

# 3) Abstract away display the displays

# 4) 
