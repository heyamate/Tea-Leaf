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

	#correction for Aces
	hand.select{|e| e == "Ace"} .count.times do
		total -= 10 if total > 21
	end

	total
end

def show_hand(cards)
	hand 
end
puts "Welcome to Blackjack"

#create deck
suit = ['Heart', 'Diamond', 'Spade', 'Club']
cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']

deck = suit.product(cards)
deck.shuffle!

#Deal

my_hand = []
dealer_hand = []

2.times do
	my_hand << deck.pop
	dealer_hand << deck.pop
end

my_amount = calculate_total(my_hand)

puts "You have in your hand #{my_hand}"
puts "Your total is #{my_amount}"

binding.pry

puts "Did you all want to:"
puts "1) Hit or"
puts "2) Stay"
gets.chomp