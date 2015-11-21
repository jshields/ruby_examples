class Bird
	@@flight_birds = {"penguin"=>false, "pidegeon"=>true, "ostridge"=>false, "eagle"=>true, "flamingo"=>true}
	@@number_of_birds = 0
	@@wild_birds = []
	
	def initialize(name, species, gender, description, habitat)
		@@number_of_birds += 1
		@name = name
		@species = species
		@gender = gender
		@description = description
		@habitat = habitat
		# figure out the boolean for if the bird can fly based on its species
		if @@flight_birds.key?(@species)
			@can_fly = @@flight_birds.fetch(@species)
		else
			@can_fly = true
		end
		
		# add the initialized bird to the list of wild birds, the wild_birds array
		@@wild_birds << self
	end
	
	# define getters
	def name
		return @name
	end
	
	def species
		return @species
	end
	
	def gender
		return @gender
	end
	
	def description
		return @description
	end
	
	def habitat
		return @habitat
	end
	
	def can_fly?
		return @can_fly
	end
	
	def self.number_of_birds
		return @@number_of_birds
	end
	
	def self.wild_birds
		return @@wild_birds
	end
	
	def self.flight_birds
		return @@flight_birds
	end
	
	# define setters
	def name=(name)
		@name = name
	end
	
	def species=(species)
		@species = species
	end
	
	def gender=(gender)
		@gender = gender
	end
	
	def description=(description)
		@description = description
	end
	
	def habitat=(habitat)
		@habitat = habitat
	end
	
	def self.can_fly(species)
		@@flight_birds[species] = true;
	end
	
	def self.cannot_fly(species)
		@@flight_birds[species] = false;
	end
	
	# some actions that a bird can do
	def peck
		print "The bird pecks you and then flees!\n"
	end
	
	def pose
		# use the can_fly Boolean for a given species to determine whether the bird should fly away or run away
		if @@flight_birds.fetch(@species)
			print "The bird shows off for a picture and flies away!\n"
		else
			print "The bird shows off for a picture and runs away!\n"
		end
	end

	# return a human readable string version of the bird object
	def to_s
		return "#{@name.capitalize} is a #{@gender ? "male" : "female"} #{@species} who #{can_fly? ? "can" : "cannot"} fly, described as #{@description}."
	end
	
	# convert all of the birds to a YAML string
	def self.to_yaml
			fout = File.open("#{@@number_of_birds}_birds.yml", "w")
			fout.print "---\n"
			@@wild_birds.each do |b|
				fout.print "- !ruby/object:Bird\n"
				fout.print "  name: #{b.name}\n"
				fout.print "  species: #{b.species}\n"
				fout.print "  gender: #{b.gender}\n"
				fout.print "  description: #{b.description}\n"
				fout.print "  habitat: #{b.habitat}\n"
				fout.print "  can_fly: #{b.can_fly?}\n"
			end
			#close the output file before the method completes
			fout.close
		end
		
		# print all the birds
		def self.print_birds
			for b in wild_birds
				print "#{b.to_s}\n"
			end
		end
end