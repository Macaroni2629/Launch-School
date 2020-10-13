# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

DECK = SUITS.product(VALUES).shuffle
deck = DECK

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_cards(player_cards, dealer_cards, deck)
  player_cards << deck.pop
  player_cards << deck.pop
  dealer_cards << deck.pop
  dealer_cards << deck.pop
end

def busted?(cards)
  card_total(cards) > 21
end

def player_turn(player_cards, dealer_cards, deck)
  answer = nil
  loop do
    prompt "Would you like to hit or stay?"
    answer = gets.chomp
    hit!(player_cards, deck) if answer == "hit"
    display_current_cards(player_cards, dealer_cards)
    break if answer == "stay" || busted?(card_total(player_cards))
  end

  if busted?(player_cards)
    display_current_cards(player_cards, dealer_cards)
  
    prompt "You busted!"

    "busted"
  else
    prompt "You chose to stay at #{card_total(player_cards)}!"
    "stay"
  end
end

def dealer_turn(dealer_cards, deck)
  loop do
    break if card_total(dealer_cards) >= 17 || busted?(card_total(dealer_cards))
    prompt "Dealer has to hit"
    hit!(dealer_cards, deck)
  end

  if busted?(dealer_cards)
    prompt "The dealer busted"
  else
    prompt "Dealer chose to stay at #{card_total(dealer_cards)}!"
    "stay"
  end
end

def card_total(cards) 
  values = cards.map{ |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value.start_with?("A")
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  values.select { |value| value.start_with?("A") }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def display_current_cards(dealer_cards, player_cards)
  prompt "Dealer has: #{dealer_cards[0..-2]} and a mystery last card"
  prompt "Player has: #{player_cards}, for a total of     
  #{card_total(player_cards)}."
end

def twenty_one?(cards)
  card_total(cards) == 21
end

def player_turn(player_cards, dealer_cards, deck)
  answer = nil
  loop do
    prompt "Would you like to hit or stay?  Type 'stay' for stay and 'hit' for hit."
    answer = gets.chomp
    hit!(player_cards, deck) if answer == "hit"
    break if answer == "stay" || busted?(player_cards)
  end
  
  if busted?(player_cards)
    display_current_cards(player_cards, dealer_cards)
    prompt "You busted!"
    sleep (2)
  else
    prompt "You chose to stay at #{card_total(player_cards)}."
  end
end
    

def busted?(player_cards)
  total = card_total(player_cards)
  total > 21
end

def hit!(cards, deck)
  cards << deck.pop
end

def calculate_winner(player_cards, dealer_cards)
  if busted?(player_cards)
    "dealer"
  elsif card_total(player_cards) > card_total(dealer_cards)
    "player"
  elsif twenty_one?(player_cards)
    "player"
  elsif busted?(dealer_cards)
    "player"
  else
    "dealer"
  end
end
    
def display_winner(player_cards, dealer_cards)
  if calculate_winner(player_cards, dealer_cards) == "player"
    prompt "You won!"

  elsif calculate_winner(player_cards, dealer_cards) == "dealer"
    prompt "You lost."

  else
    prompt "It's a tie!"
  end

  display_final_cards(player_cards, dealer_cards)
end

def display_final_cards(player_cards, dealer_cards)
  prompt "The dealer had " + "#{dealer_cards}" +
         " for a total of #{card_total(dealer_cards)}."
  prompt "You had " + "#{player_cards}" +
         " for a total of #{card_total(player_cards)}."
end
  
def reset_decks(player_cards, dealer_cards)
  player_cards.clear
  dealer_cards.clear
end

def play_again?
  puts "-----------------------"
  loop do
    prompt("Do you want to play again? Type Y/Yes or N/No.")
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      return false
    elsif answer == "y" || answer == "yes"
      break true
    else
      prompt("Sorry, what was that? Say Y/Yes, N/No please.")
    end
  end
end

  

player_cards = []
dealer_cards = []


  prompt "Welcome to blackjack!  Person who hits 21 or gets closest without busting wins!  Let's play!"

loop do
  
  loop do 
    prompt "The dealer will now deal..."
    
    initialize_cards(player_cards, dealer_cards, deck)

    display_current_cards(player_cards, dealer_cards)
    
    player_turn(player_cards, dealer_cards, deck)
    break if busted?(player_cards) || twenty_one?(player_cards)
    
    dealer_turn(dealer_cards, deck)
    break if busted?(dealer_cards) || twenty_one?(dealer_cards)
    
    break if !calculate_winner(player_cards, dealer_cards).nil?
    break if player_turn(player_cards, dealer_cards, deck).include?("stay")
    break if dealer_turn(player_cards, dealer_cards, deck).include?("stay")
    
  end
  calculate_winner(player_cards, dealer_cards)
  display_winner(player_cards, dealer_cards)
  reset_decks(player_cards, dealer_cards)

  break unless play_again?
  
end

