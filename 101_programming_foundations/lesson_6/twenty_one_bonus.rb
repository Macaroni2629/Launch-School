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
MAX_TOTAL = 21
FACE_CARDS = ["K", "Q", "J"]
ACE = "A"
PLAYER_OPTIONS = ["h", "s"]

DECK = FACE_CARDS.product(VALUES).shuffle
deck = DECK

def prompt(msg)
  puts "=> #{msg}"
end

def create_hand(deck)
  cards = []
  cards << deck.pop
  cards << deck.pop
  cards
end

def card_total(player_cards)
  total = 0
  player_cards.each.with_index do |subarray, index| # each value is a subarray
    if FACE_CARDS.include?(subarray[1])
      total += 10
    elsif subarray[1] == ACE
      total += 11
    else 
      total += subarray[1].to_i
    end
  end
  
  total
end

def card_total_for_dealer(dealer_cards)
  total = 0
  dealer_cards.each.with_index do |subarray, index| # each value is a subarray
    if FACE_CARDS.include?(subarray[1])
      total += 10
    elsif subarray[1] == ACE
      total += 11
    else 
      total += subarray[1].to_i
    end
  end
  
  total
  
end

def display_current_cards(dealer_cards, player_cards)
  prompt "Dealer has: #{display_dealer_cards(dealer_cards)} and a mystery last card"
  prompt "Player has: #{player_cards}, for a total of     
  #{card_total(player_cards)}."
end

def display_dealer_cards(dealer_cards)
  last_card_index = (dealer_cards.length) - 1
  dealer_cards = dealer_cards
  dealer_cards.delete_at(last_card_index)
end

def joinor(array, separator = ", ", ending = "or")
  case array.size
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{ending} ")
  else
    array[-1] = "#{ending} #{array.last}"
    array.join(separator)
  end
end

def player_turn(player_cards, dealer_cards, deck)
  answer = nil
  loop do
    prompt "Would you like to hit or stay?  Type 'stay' for stay and 'hit' for hit."
    answer = gets.chomp
    hit!(player_cards, dealer_cards, deck) if answer == "hit"
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

def hit!(player_cards, dealer_cards, deck)
  player_cards << deck.pop
  display_current_cards(player_cards, dealer_cards)
  player_cards
end
    
def dealer_turn(dealer_cards, deck)
  

player_cards = []
dealer_cards = []


prompt "Welcome to blackjack!  Person who hits 21 or gets closest without busting wins!  Let's play!"

loop do
  player_turn = nil
  loop do 
  
    player_cards = create_hand(deck)
    dealer_cards = create_hand(deck)
    
    display_current_cards(dealer_cards, player_cards)
    
    player_turn(player_cards, dealer_cards, deck)
    dealer_turn(dealer_cards, deck)
    

    break 
  end
  
  break
end

