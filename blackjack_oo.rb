require "rubygems"
require "pry"

class Card 
  attr_accessor :suit, :face_value

  def initialize (s,fv)
    @suit = s
    @face_value = fv
  end

  def pretty_output
    "The #{face_value} of #{suit}"
  end

  def to_s
    pretty_output
  end
end

class Deck
  attr_accessor :cards

  def initialize 
    @cards = []
    ['Hearts', 'Diamonds', 'Spades', 'Clubs']. each do |suit|
      ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace'].each do |face_value|
        @cards << Card.new(suit, face_value)
        @cards.shuffle!
      end
    end
  end

  def deal
    cards.pop
  end
end

module Hand

  def show_hand
    puts "----- #{name}'s cards -----"
    cards.each do |cards|
      puts "=> #{cards}"
    end
    puts "=> #{name}'s total is #{total}"
  end

  def total
    face_values =  cards.map{|e| e.face_value}
    total = 0

    face_values.each do |value|
      if value == "Ace"
        total += 11
      elsif value.to_i == 0 #Card is King, Queen or Jack
        total += 10
      else
        total += value.to_i
      end 
    end

    # => Correction for Aces
    face_values.select{|e| e == "Ace"} .count.times do
      total -= 10 if total > Blackjack::BLACKJACK_AMOUNT
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
end

class Dealer
  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "----- Dealer's Hand -----"
    puts "=> First card is hidden"
    puts "=> Second card is #{cards[1]}"
  end
end

class Player
  include Hand
  attr_accessor :name, :cards

  def initialize (n)
    @name = n
    @cards = []
  end
end

class Blackjack
  attr_accessor :player, :deck, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 18

  def initialize(player_name)
    @player = Player.new(player_name)
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_cards
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
    player.add_card(deck.deal)
    dealer.add_card(deck.deal)
  end

  def show_flop
    player.show_hand
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Dealer)
        puts "=> Looks like the dealer hit blackjack. #{player.name} Loses"
      else
        puts "=> #{player.name} hit blackjack! #{player.name} wins!"
      end
      new_game?
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "=> Dealer busts! #{player.name} wins"
      else
        puts "=> #{player.name} busts. #{player.name} loses."
      end
      new_game?
    end
  end

  def players_turn
    blackjack_or_bust?(player)
    puts "=> #{player.name}'s Turn"

    while player.total < BLACKJACK_AMOUNT
      puts "=> Do you want to 1) Hit or 2) Stay"
      response = gets.chomp

      # => Make sure only 1 or 2 is chosen
      if !["1","2"].include?(response)
        puts "=> You can only choose 1 or 2"
        next
      end
      
      # => Hit
      if response == "1"
        player.add_card(deck.deal)
        puts "=> #{player.name} has chosen to hit"
        player.show_hand
        blackjack_or_bust?(player)
      end

      # => Stay
      if response == "2"
        puts "=> #{player.name} has chosen to stay."
        break
      end
    end
  end

  def dealers_turn
    puts "=> Dealers turn"
    dealer.show_hand
    blackjack_or_bust?(dealer)
    while dealer.total < DEALER_HIT_MIN
      puts "=> Dealer decides to Hit"
      dealer.add_card(deck.deal)
      puts "=> Dealer hand is now:"
      dealer.show_hand
    end
    blackjack_or_bust?(dealer)
  end

  def who_won?
    if player.total > dealer.total
      puts "=> #{player.name} wins!"
    elsif dealer.total > player.total
      puts "=> Dealer wins. #{player.name} loses"
    else
      puts "=> It's a draw"
    end
    new_game?
  end

  def new_game?
    puts "=> Would you like to play a new game?"
    puts "=> 1) Yes"
    puts "=> 2) No"
    if gets.chomp == "1"
      "Starting new game"
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye :)"
      exit
    end
  end

  def start
    deal_cards
    show_flop
    players_turn
    dealers_turn
    who_won?
    new_game?
  end


end

puts "What is your name?"
player_name = gets.chomp.capitalize
game = Blackjack.new(player_name)
game.start


