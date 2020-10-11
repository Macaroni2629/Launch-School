=begin
Computer turn refinements
a) We actually have the offense and defense steps backwards. In other words, if the computer has a chance to win, it should take that move rather than defend. As we have coded it now, it will defend first. Update the code so that it plays the offensive move first.
b) We can make one more improvement: pick square #5 if it's available. The AI for the computer should go like this: first, pick the winning move; then, defend; then pick square #5; then pick a random square.
c) Can you change the game so that the computer moves first? Can you make this a setting at the top (i.e. a constant), so that you could play the game with either player or computer going first? Can you make it so that if the constant is set to "choose", then your game will prompt the user to determine who goes first? Valid options for the constant can be "player", "computer", or "choose".
=end
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
[[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
[[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
def prompt(msg)
  puts "=> #{msg}"
end
# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}.  Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "      |     |"
  puts "   #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "      |     |"
  puts " -----+-----+-----"
  puts "      |     |"
  puts "   #{brd[4]}  |  #{brd[5]}  |  #{brd[6]} "
  puts "      |     |"
  puts " -----+-----+-----"
  puts "      |     |"
  puts "   #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "      |     |"
  puts ""
end
# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end
def joinor(arr, delimiter=", ", word="or ")
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.first + word + arr.last
  else
    arr[-1] = word + arr.last.to_s
    arr.join(delimiter)
  end
end
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}."
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end
def computer_defense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      empty_index =  brd.values_at(*line).index(INITIAL_MARKER)
      if empty_index
        return line[empty_index]
      else
        next
      end
    end
  end
  nil
end
def computer_offense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      empty_index =  brd.values_at(*line).index(INITIAL_MARKER)
      if empty_index
        return line[empty_index]
      else
        next
      end
    end
  end
  nil
end
def pick_square_five(brd)
  empty_squares(brd).include?(brd[5])
  brd[5] = COMPUTER_MARKER
end
def computer_places_piece!(brd)
  if !square = computer_offense(brd)
    if !square = computer_defense(brd)
      if !square = pick_square_five(brd)
        square = empty_squares(brd).sample
      end
    end
  end
  brd[square] = COMPUTER_MARKER
end
def board_full?(brd)
  empty_squares(brd).empty?
end
def someone_won?(brd)
  !!detect_winner(brd)
end
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #       brd[line[1]] == COMPUTER_MARKER &&
    #       brd[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
  end
  nil
end
def initialize_scoreboard
  score = {'Player' => 0, 'Computer' => 0}
end
def update_score(winner, score)
  if winner == 'Player'
    score['Player'] += 1
  elsif winner == 'Computer'
    score['Computer'] += 1
  end
end
def display_score(score)
  puts "SCOREBOARD"
  puts "Player: #{score['Player']}"
  puts "Computer: #{score['Computer']}"
end
def three_wins?(score)
  if score['Player'] == 3
    return true
  elsif score['Computer'] == 3
    return true
  end
  false
end
puts "Welcome to Tic Tac Toe.  Best of 3 rounds wins!"
score = initialize_scoreboard
display_score(score)
sleep (3)
loop do
  board = initialize_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  winner = detect_winner(board)
  update_score(winner, score)
  display_score(score)
  break if three_wins?(score)
  prompt "Play again?  (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing Tic Tac Toe!  Good bye."