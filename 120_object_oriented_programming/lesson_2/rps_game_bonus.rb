class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end
  def rock?
    @value == 'rock'
  end
  
  def paper?
    @value == 'paper'
  end
  
  def lizard?
    @value == 'lizard'
  end
  
  def spock?
    @value == 'spock'
  end

  def >(other_move)
    rock? && other_move.scissors? ||
      paper? && other_move.rock? ||
      scissors? && other_move.paper? ||
      rock? && other_move.lizard? ||
      paper? && other_move.spock? ||
      scissors? && other_move.lizard? ||
      lizard? && other_move.spock? ||
      lizard? && other_move.paper? ||
      spock? && other_move.rock? ||
      spock? && other_move.scissors?
  end

  def <(other_move)
    rock? && other_move.paper? ||
    paper? && other_move.scissors? ||
    scissors? && other_move.rock? ||
    rock? && other_move.spock? ||
    paper? && other_move.lizard? ||
    scissors? && other_move.spock? ||
    lizard? && other_move.rock? ||
    lizard? && other_move.scissors? ||
    spock? && other_move.paper? ||
    spock? && other_move.lizard?
  end
end

def to_s
  @value
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
    choice = nil
      loop do
        puts "Please choose rock, paper, scissors, lizard, or spock:"
        choice = gets.chomp
        break if Move::VALUES.include? choice
        puts "Sorry, invalid choice."
      end
      self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
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
    elsif human.move < computer.move
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

# Add a class for each move

# What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  
  def to_s
    self.class.to_s 
  end  
end

class Rock < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    self.name && other_move.name == "scissors" ||
    self.name && other_move.name == "lizard"
  end
  
  def <(other_move)
    self.name && other_move.name == "paper" ||
    self.name && other_move.name == "spock"
  end
    
end

class Paper < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    self.name && other_move.name == "rock" ||
    self.name && other_move.name == "spock"
  end
  
  def <(other_move)
    self.name && other_move.name == "scissors" ||
    self.name && other_move.name == "lizard"
  end
end

class Scissors < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
    def >(other_move)
    self.name && other_move.name == "paper" ||
    self.name && other_move.name == "lizard"
  end
  
  def <(other_move)
    self.name && other_move.name == "rock" ||
    self.name && other_move.name == "spock"
  end
end

class Lizard < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
    def >(other_move)
    self.name && other_move.name == "spock" ||
    self.name && other_move.name == "paper"
  end
  
  def <(other_move)
    self.name && other_move.name == "rock" ||
    self.name && other_move.name == "scissors"
  end
end

class Spock < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    self.name && other_move.name == "rock" ||
    self.name && other_move.name == "scissors"
  end
  
  def <(other_move)
    self.name && other_move.name == "paper" ||
    self.name && other_move.name == "lizard"
  end
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
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
    elsif human.move < computer.move
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

# Add a class for each move

# What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  
  def to_s
    self.class.to_s 
  end  
end

class Rock < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    other_move.name == "scissors" || other_move.name == "lizard"
  end

end

class Paper < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    other_move.name == "rock" || other_move.name == "spock"
  end
end

class Scissors < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    other_move.name == "paper" || other_move.name == "lizard"
  end
end

class Lizard < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
    def >(other_move)
    other_move.name == "spock" || other_move.name == "paper"
  end
end

class Spock < Move
  attr_reader :name
  def initialize
    @name = self.to_s.downcase
  end
  
  def >(other_move)
    other_move.name == "rock" || other_move.name == "scissors"
  end
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
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

# Add a class for each move

# What would happen if we went even further and introduced 5 more classes, one for each move: Rock, Paper, Scissors, Lizard, and Spock. How would the code change? Can you make it work? After you're done, can you talk about whether this was a good design decision? What are the pros/cons?

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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
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

# Computer personalities

# We have a list of robot names for our Computer class, but other than the name, there's really nothing different about each of them. It'd be interesting to explore how to build different personalities for each robot. For example, R2D2 can always choose "rock". Or, "Hal" can have a very high tendency to choose "scissors", and rarely "rock", but never "paper". You can come up with the rules or personalities for each robot. How would you approach a feature like this?

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
end

class Scissors < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["paper", "lizard"]
  end
end

class Lizard < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["spock", "paper"]
  end
end

class Spock < Move
  def initialize
    @name = self.to_s.downcase
    @beats = ["rock", "scissors"]
  end
end

class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    set_name 
    @score = 0
    @history = []
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
    choice = nil
      loop do
        puts "Please choose rock, paper, scissors, lizard, or spock:"
        choice = gets.chomp
        break self.history << choice if Move::VALUES.include? choice
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
    case self.name 
      when 'R2D2' then self.move = Rock.new
      when 'Hal' then self.move = [Scissors, Scissors, Scissors, Rock, Lizard, Lizard, Spock, Spock].sample.new
      when 'Chappie' then self.move = Lizard.new
      when 'Sonny' then self.move = Spock.new
      when 'Number 5' then self.move = Scissors.new 
      end
      self.history << self.move.to_s.downcase  
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
    puts "Welcome to Rock, Paper, Scissors, Lizard, and Spock!!  First to #{WINNING_SCORE} wins wins!"
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
  
  def display_history
    puts "#{computer.name}'s Choices: #{computer.history}"
    puts "#{human.name}'s Choices: #{human.history}" 
  end


  def play
    loop do
      
      display_welcome_message

      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_history
        display_score
        break if check_winner
        break unless play_again?
      end
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