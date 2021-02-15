# Tic Tac Toe
# It is a game in which there are two players, one computer and one human.  Human and computer take turns placing markers on  a 3 x 3 board.  The first player to get 3 in a row horizontally, vertically, or diagonally wins.  A tie is also possible.

# Nouns
#   TTTGame
#     winning
#     tie
#     play
#   Players (human, computer)
#     turns
#     placing
#   Marker
#   Board (row)


class TTTGame
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @result
    @turn = human
  end
  
  def play
    display_welcome_message
    choose_markers
    loop do
      board.display
      player_turn
      break if tie? || won?
    end
    display_winner
    display_goodbye_message
  end
  
  private
  attr_accessor :human, :computer, :board, :turn
  
  def display_welcome_message
    puts "Welcome to Tic-Tac-Toe!"
    puts "What would you like to be called?"
    human.name = valid_name
    puts "First to 3 in a row wins!"
  end
  
  def valid_name
    loop do
      input = gets.chomp
      break input unless input.empty? || input.squeeze == " "
    end
  end
  
  def choose_markers
    human.select_marker
    computer.select_marker(human.marker)
  end
  
  def player_turn
    if turn == human
      human.select_spot(board)
      board.mark(human.choice, human.marker)
      self.turn = computer
    else
      computer.select_spot(board)
      board.mark(computer.choice, computer.marker)
      self.turn = human
    end
  end
  
  def won?
    WINNING_LINES.each do |line|
      return @result = human if line.all? {|num| board.squares[num] == human.marker }
      return @result = computer if line.all? {|num| board.squares[num] == computer.marker }
    end
    false
  end
  
  def tie?
    board.squares.values.none? { |value| value == ' ' }
  end
  
  def display_winner
    board.display
    if @result == human
      puts "#{human.name} won!"
    elsif @result == computer
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end
  
  def display_goodbye_message
    puts "Thanks for playing!  Have a nice day."
  end
end

class Player
  attr_accessor :marker, :name, :choice
  
  def initialize
    @marker # Have player choose one (Marker.new(choice)
    @choice # return value of select_spot?
    @name # Have player choose one
  end

end

class Human < Player

  def select_marker
    choice = nil
    loop do
      puts "#{name}: Do you want to be X's or O's?"
      choice = gets.chomp
      break choice unless !valid_choice?(choice)
    end
    self.marker = choice
  end
  
  def valid_choice?(choice)
    Marker::VALID_CHOICES.include?(choice)
  end
  
  def select_spot(board)
    puts "Pick an avaliable spot: #{board.empty_squares}"
    input = nil
    loop do
      input = gets.chomp.to_i
      break if board.empty_squares.include?(input)
      puts "Sorry pick an avaliable spot."
    end
    self.choice = input
  end
end

class Computer < Player
  def select_marker(human_choice)
    if %w[X x].include?(human_choice)
      self.marker = "O"
    else
      self.marker = "X"
    end
  end
  
  def select_spot(board)
    self.choice = board.empty_squares.sample
  end
end

class Marker
  VALID_CHOICES = %w[X O x o]
  
  def initialize
    @symbol #Set by the player
  end
end

class Board
  attr_reader :squares
  
  def initialize
    @squares = Hash.new(0)
    (1..9).each { |number| @squares[number] = ' '}
  end
  
  def empty_squares
    squares.select { |key, value| value == " " }.keys
  end
  
  def display
    puts "TIC TAC TOE".center(18)
    puts "1    |2    |3"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "4    |5    |6"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]} "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "7    |8    |9"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]} "
    puts "     |     |"
    puts ""
  end
  
  def mark(player_choice, player_marker)
    p player_choice
    squares[player_choice] = player_marker
    
  end
end



game = TTTGame.new
game.play