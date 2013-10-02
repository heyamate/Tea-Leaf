def says(msg)
	puts "=> #{msg}"
end	

says "Welcome to the calculator app"
says "What is your first number?"
num1 = gets.chomp

says "What is your second number?"
num2 = gets.chomp

says "Would you like to 1) Add 2) Minus 3) Multiply or 4) Divide?"
response = gets.chomp

case response
	when "1"
		answer = num1.to_i + num2.to_i
	when "2"
		answer = num1.to_i - num2.to_i
	when "3"	
		answer = num1.to_i * num2.to_i
	when "4"
		answer = num1.to_i / num2.to_i
	else
		says "#{response} isn't a valid answer"
end	

says "The answer is #{answer}" unless answer.nil?