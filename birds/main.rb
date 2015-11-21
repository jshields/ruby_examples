require './bird'
require 'psych'

# score keeps track of how well the player is doing at bird watching
# each correct species guess gives one point, but an incorrect guess causes a loss of one point
$score = 0

# some birds to start with if the player has not created enough but wants to play the bird watching game
def populate_default_birds
	bird1 = Bird.new("Bob", "penguin", true, "tuxedo", "on ice")
	bird2 = Bird.new("George", "eagle", true, "American", "in a pine tree");
	bird3 = Bird.new("Jill", "flamingo", false, "pink and tall", "by a lagoon");
	for b in Bird.wild_birds
		print "#{b.to_s}\n"
	end
end

# main driver method for making or watching birds in the game
def make_or_watch
	response = gets.chomp
	if response.include?("create") || response.include?("make")
		# if the player's response included "create" or "make" it means they want to make birds on this cycle
		# print prompts and get player input for each of the hypothetical bird's basic attributes, storing each one in a variable
		print "Let's make birds! Enter the name, species, gender, description, and habitat one at a time.\n"
		print "Please enter the bird's given name:\n"
		temp_name = gets.chomp.capitalize
		print "Please enter the bird's species:\n"
		temp_species = gets.chomp
		# if the player enters a word including "m," (true) the bird is male/man/masculine/'M' otherwise the bird is female. Any input without an m (false) is interpreted as female
		print "Please enter the bird's gender:\n"
		temp_gender = gets.chomp.include?("m")
		print "Please enter the bird's description:\n"
		temp_description = gets.chomp
		print "Please enter the bird's habitat:\n"
		temp_habitat = gets.chomp
		
		# if we don't already have an entry on whether this bird can fly,
		# we need to ask the user if the bird can fly and add it to the map
		if Bird.flight_birds.key?(temp_species)
			print "It looks like this species can fly!\n"
		else
			print "One more thing... Can this bird fly? Y/N:\n"
			response = gets.chomp.downcase
			if response.include?("y")
				# add this species to the map as a bird that can fly
				Bird.can_fly(temp_species)
			elsif response.include?("n")
				# add this species to the map as a bird that cannot fly
				Bird.cannot_fly(temp_species)
			else
				# rather than re-prompt, just move the program along by assuming that the bird can fly
				print "I didn't understand your response. I'll just assume this bird can fly.\n"
				Bird.can_fly(temp_species)
			end
		end
		# once we have all of the required information for a constructor, we can make the bird
		temp_bird = Bird.new(temp_name, temp_species, temp_gender, temp_description, temp_habitat)
		# confirm to the user that the bird was created by name, print the current birds, then ask if they want to make more or go bird watching on the next cycle
		print "You made a bird named #{temp_bird.name}!\n"
		print "There are currently #{Bird.number_of_birds} birds:\n"
		Bird.print_birds
		print "Would you like to make more birds or go bird watching?\n"
	elsif response.include?("watching") || response.include?("watch")
		# if the player included "watching" or "watch" in their response, it means they want to play the bird watching game
		# if the player doesn't have enough birds, give them a message and create the default birds for them
		if Bird.number_of_birds == 0
			print "It looks like you haven't made birds yet! I'll create some for you.\n"
			populate_default_birds
		elsif Bird.number_of_birds == 1
			print "You only created one bird! If we're going bird watching, I should add some more.\n"
			populate_default_birds
		else
			# if the player has 2 or more birds, they have the bare minimum for playing the watching game so we don't create the default birds
			print "Great! "
		end
		
		# since we know they have some birds by this point, let's output a YAML file for them as well
		print "As a special bonus you will also get a YAML file of your bird data.\n"
		Bird.to_yaml
		# use the YAML module to emmit YAML for another version of the file
		fout = File.open("#{Bird.number_of_birds}_birds_psych.yml", "w")
		fout.print(Psych.dump(Bird.wild_birds))
		fout.close
			
		# the current cycle of the bird watching game officially starts
		print "Let's go bird watching!\n"
		# get a random number based on the number of birds to represent the index of a random bird
		spotted_bird_index = rand(Bird.number_of_birds)
		# get the random bird from the array of birds with its index
		the_bird = Bird.wild_birds[spotted_bird_index]
		# print the clues to the player and have them input a guess of the species
		print "A bird who looks #{the_bird.description} is perched #{the_bird.habitat}.\n"
		print "Guess the species of the bird!\n"
		guess = gets.chomp.downcase
		
		# if the player guesses correctly, the bird will show off for a picture and the player gets a point
		# if the player guesses incorrectly, the bird will peck at the player and the player will lose a point
		if guess.include?(the_bird.species.downcase)
			print "You guessed right! It's #{the_bird.name} the #{the_bird.species}.\n"
			the_bird.pose
			$score += 1
		else
			print "You guessed wrong! "
			the_bird.peck
			$score -= 1
		end
		# tell the player their current bird watching score and ask if they want to keep watching or go make more birds
		print "Your score is #{$score}.\n"
		print "Would you like to keep bird watching or make birds?\n"
	end
	# if the player's reponse didn't evaluate to a desire for making or watching birds, or if they finished one game cycle, restart the cycle
	make_or_watch
end

# give a welcome message and start the play cycle
print "Welcome to the bird game!\n"
print "Would you like to make birds or go bird watching?\n"
make_or_watch