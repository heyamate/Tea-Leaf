require 'pry'

def calculate_total(cards)
	# [['a', '1'],['a', '2']]
	hand =  cards.map{|e| e[1]}
	total = 0

	hand.each do |value|
		if value == "Ace"
			total += 11
		elsif value.to_i == 0 #Card is King, Queen or Jack
			total += 10
		else
			total += value.to_i
		end	
	end

	# => Correction for Aces
	hand.select{|e| e == "Ace"} .count.times do
		total -= 10 if total > 21
	end

	total
end

def show_hand(cards)
	cards.each do |v|
		test = v.reverse
		puts "A #{test[0]} of #{test[1]}"
	end
end

# => Start Game

puts "Welcome to Blackjack"
puts "What is your name?"
name = gets.chomp
puts "Ok, #{name} lets deal!"
name.capitalize!
# => Create Deck

suit = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']

deck = suit.product(cards)
deck.shuffle!

# => Deal Cards

my_hand = []
dealer_hand = []

2.times do
	my_hand << deck.pop
	dealer_hand << deck.pop
end

my_amount = calculate_total(my_hand)
dealer_amount = calculate_total(dealer_hand)

# => Show Cards

puts "In your hand you have:"
show_hand(my_hand)
puts "Your total is #{my_amount}"
puts ""
puts "The dealer has:"
show_hand(dealer_hand)
puts "Their total is #{dealer_amount}"

if my_amount == 21
	puts "You got Blackjack! Congratuations #{name}, you win!!!"
	exit
elsif dealer_amount == 21
	puts "Dealer got Blackjack. Sorry #{name}. You lose"
	exit
end

# => Players Turn

while my_amount < 21
	puts ""
	puts "Did you all want to:"
	puts "1) Hit or"
	puts "2) Stay"
	hit_or_stay = gets.chomp
	
	# => Error checking

	if !["1","2"].include?(hit_or_stay)
		puts "You can only choose 1 or 2"
		next
	end

	# => Hit

	if hit_or_stay == "1"
		my_hand << deck.pop
		my_amount = calculate_total(my_hand)
		puts ""
		puts "You now have:"
		show_hand(my_hand)
		puts "Your total is #{my_amount}"
		if my_amount == 21
			puts "You got Blackjack! Contratulations #{name}, you win!"
			exit
		elsif my_amount > 21
			puts "Looks like you busted #{name}. You are out"
			exit
		end
	end

	# => Stay

	if hit_or_stay == "2"
		puts "You have chosen to stay"
		break
	end
end

# => Dealers Turn

while dealer_amount < 18
	puts "Dealer has chosen to hit..."
	dealer_hand << deck.pop
	dealer_amount = calculate_total(dealer_hand)
	puts ""
	puts "The dealer has:"
	show_hand(dealer_hand)
	puts "Their total is #{dealer_amount}"
end

if dealer_amount == 21
	puts "Dealer has Blackjack. #{name} loses"
	exit
elsif dealer_amount > 21
	puts "Dealer busts. #{name} wins!"
	exit
end

# => End game

if dealer_amount > my_amount
	puts "Dealer has the higher hand. #{name} loses."
	exit
elsif dealer_amount < my_amount
	puts "You have the higher hand. #{name} wins!"
	exit
else
	puts "The game is a draw"
	exit
end
















