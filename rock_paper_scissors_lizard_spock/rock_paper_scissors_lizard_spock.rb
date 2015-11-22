# Rock-paper-scissors-lizard-spock by Josh Shields, IT 211

# Include the Matrix class in this script
require 'matrix'

# Layout a 2D board for the game's possible outcomes, in rows and columns
$game_table = Matrix[
			  ['T-bounces off', 'L-gets covered by', 'W-crushes', 'W-crushes', 'L-gets vaporized by'],
		      ['W-covers', 'T-stacks nicely with', 'L-gets cut by', 'L-gets eaten by the', 'W-disproves'],
		      ['L-gets crushed by', 'W-cuts', 'T-clashes with', 'W-decapitates the', 'L-get smashed by'],
		      ['L-gets crushed by', 'W-eats', 'L-gets decapitated by', 'T-meets', 'W-poisons'],
		      ['W-vaporizes', 'L-gets disproven by', 'W-smashes', 'L-gets poisoned by the', 'T-,just like in the new Star Trek movies, meets']
		    ]

# Create a hash between the player choices and the column/row they correspond to in the matrix
$choice_hash = {"rock"=>0, "paper"=>1, "scissors"=>2, "lizard"=>3, "spock"=>4}

# Method for printing the game board for the player to see
def print_table()
	print "\nGame Board:\nW = Win, L = Lose, T = Tie\n
	+-----------+------+-------+----------+--------+-------+
	|you v cpu >| Rock | Paper | Scissors | Lizard | Spock |
	+-----------+------+-------+----------+--------+-------+
	| Rock      |   T  |   L   |    W     |    W   |   L   |
	+-----------+------+-------+----------+--------+-------+
	| Paper     |   W  |   T   |    L     |    L   |   W   |
	+-----------+------+-------+----------+--------+-------+
	| Scissors  |   L  |   W   |    T     |    W   |   L   |
	+-----------+------+-------+----------+--------+-------+
	| Lizard    |   L  |   W   |    L     |    T   |   W   |
	+-----------+------+-------+----------+--------+-------+
	| Spock     |   W  |   L   |    W     |    L   |   T   |
	+-----------+------+-------+----------+--------+-------+\n"
end

# Main Play method for driving the game in repitition
def play(player_score, computer_score)
	# Display the scores, starting at 0 and carrying over from the previous round
	print "Current score is: Player: ", player_score, ", Computer: ", computer_score, "\n"

	# Record the player's choice, making sure that it is a valid key selection from the hash map
	player_choice = nil
	while (player_choice.class == NilClass)
		print "\nPlease make a selection. Type Rock, Paper, Scissors, Lizard, or Spock:\n"
		player_input = gets.chomp.downcase
		player_choice = $choice_hash[player_input]

		if (player_choice.class == NilClass)
			player_input = ""
			player_choice = nil
			puts "Invalid selection."
		end
	end

	# The computer selects randomly, from 1 of 5 choices along the game board
	computer_choice = rand(5)

	# Results is an array split by '-' from a cell in the game board matrix,
	# with index 0 being the Win/Tie/Lose result (outcome) and index 1 being the description of the result (verb)
	results = $game_table[player_choice, computer_choice].split("-")
	outcome = results[0]
	verb = results[1]

	# Convert the integer computer choice into the English word choice equivalent for printing
	computer_choice = $choice_hash.key(computer_choice).dup
	if (computer_choice == "spock")
		computer_choice.capitalize!
	end

	# Print choices
	print "You chose " + player_input + ", computer chose " + computer_choice + ".\n"

	# Print the message that describes the round to the player
	message = player_input.capitalize + " " + verb + " " + computer_choice + ".\n"
	puts message

	# Print a message and award points to the winner
	if (outcome == 'W')
		print "Player gets a point!\n"
		player_score += 1
	elsif (outcome == 'L')
		print "Computer gets a point!\n"
		computer_score += 1
	elsif (outcome == 'T')
		print "It's a tie! Half point for each.\n"
		player_score += 0.5
		computer_score += 0.5
	end

	# Start the next round, carrying over the scores
	play(player_score, computer_score)
end

# Player and Computer score must be floats to support half points on tie games
player_score = 0.0
computer_score = 0.0

#Welcome the player, make a call to print the game table, and make the first call to Play to start the game
print "Welcome to Rock-paper-scissors-lizard-spock!\nPress Ctrl + C when you're done playing.\n"
print_table()
play(player_score, computer_score)