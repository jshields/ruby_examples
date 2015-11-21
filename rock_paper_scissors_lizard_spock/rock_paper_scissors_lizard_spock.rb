# 2D array for rock-paper-scissors-lizard-spock
# Rock
# Paper
# Scissors
# Lizard
# Spock

require 'matrix'

game_table = Matrix[
			  ['T bounces off', 'L gets covered by', 'W crushes', 'W crushes', 'L gets vaporized by'],
		      ['W covers', 'T stacks nicely with', 'L gets cut by', 'L gets eaten by', 'W disproves'],
		      ['L gets crushed by', 'W cuts', 'T clash with', 'W decapitate', 'L get smashed by'],
		      ['L gets crushed by', 'W eats', 'L gets decapitated by', 'T meets', 'W poisons']
		      ['W vaporizes', 'L gets disproven by', 'W smashes', 'L gets poisoned by', 'T ,just like in the new Star Trek movies, meets']
		    ]
		    
def print_table()
	print "W = Win, L = Lose, T = Tie\n
	+-----------+------+-------+----------+--------+-------+
	|           | Rock | Paper | Scissors | Lizard | Spock |
	+-----------+------+-------+----------+--------+-------+
	| Rock      |   T  |   L   |     W    |     W  |     L |
	+-----------+------+-------+----------+--------+-------+
	| Paper     |   W  |   T   |    L     |     L  |   W   |
	+-----------+------+-------+----------+--------+-------+
	| Scissors  |   L  |   W   |    T     |   W    |    L  |
	+-----------+------+-------+----------+--------+-------+
	| Lizard    |   L  |   W   |    L     |   T    |   W   |
	+-----------+------+-------+----------+--------+-------+
	| Spock     |  W   |   L   |    W     |    L   |   T   |
	+-----------+------+-------+----------+--------+-------+\n"
end

#testing
print "should be T: ", game_table[0,0], "\n"

choice_hash = {"rock"=>0, "paper"=>1, "scissors"=>2, "lizard"=>3, "spock"=>4}

# Player and Computer score must be floats to support half points on tie games
p_score = 0.0
c_score = 0.0

print "Welcome to Rock-paper-scissors-lizard-spock!\n"
print_table()
def play()
	print "Current score is:\nPlayer: ", p_score, "\nComputer: ", c_score, "\n"

	p_input = gets.chomp.downcase
	p_choice = choice_hash[p_input]
	c_choice = rand(5)
	verb = "does something to"
	results=[]

	
	if (choice_hash[p_choice].class != NilClass)
		results = game_table[p_choice, c_choice].split()
		verb = 
		message = p_input.capitalize + " " + verb + choice_hash.key(c_choice)
		puts message
	end

	if (result == 'W')
		print "Player gets a point!\n"
		p_score += 1
	elsif (result == 'L')
		print "Computer gets a point!\n"
		c_score += 1
	elsif (result == 'T')
		print "It's a tie! Half point for each.\n"
		p_score += 0.5
		c_score += 0.5
	end

	# Make another call to this same function if the user answered 'Y' for yes, exit if 'N' for no, or prompt again if input is invalid 
	answer = ""
	while answer != 'y' and answer != 'n' do
		print "Would you like to keep playing? Y/N\n"
		answer = gets.chomp.downcase
		if (answer == 'y')
			play()
		elsif (answer == 'n')
			return
		else
			print "Sorry, that doesn't seem to be a valid response. Only type 'Y' or 'N'\n"
		end
	end
end


#
#STDIN.puts ""
#STDIN.puts "Please choose rock, paper, scissors, lizard, or Spock:"
#p_choice = gets.chomp.to_s.downcase
#
#if (p_choice not in game_table)
#	STDERR.puts "Sorry, that is not a valid choice for this game."
#else
#	c_choice = game_table[rand(5).to_i]
#end