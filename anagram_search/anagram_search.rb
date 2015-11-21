# word unscrambler / anagram finder Project 5 by Josh Shields, IT 211
# Goal: find words that can be formed from a given set of letters
# Input: a string from the user, i.e. a word or scrambled word
# Output: all valid dictionary words that can be formed from the input letters, based on the Unix dictionary

# to_array function, a user defined alias for the to_a method of the string class
def to_array(word)
	letters = []
	# each character gets one slot in the array
	word.each_char do |c|
		letters << c
	end
	return letters
end

# shorthand function for returning the permutations of a word as an array of strings
# the permutation method relies on array.c source for its implementation, although some of it can be seen in the Ruby documentation...
def get_permutations(letters)
	# create a list of permutations of letters and then join each array of letters into a word / array of characters into a string
	perms = letters.permutation.map &:join #shorthand for: perms = letters.permutation.map{ |a| a.join }
	# return the permutations of the input word
	return perms
end

# function to load the dictionary file, only needs to be called once for efficiency's sake
def load_dictionary
	# open the dictionary text file 
	dictionary_file = File.open("dict.txt", "r");
	$dictionary_hash = {}
	# while there continue to be more lines, keep loading them in from the file input stream and putting them in the hash map
	while word = dictionary_file.gets
		# chomp and downcase cannot be used inline together because each one returns nil if no modifications were made, and nil does not have either of the two methods
		# both are needed to remove the newline character and make sure that the search is not case sensitive
		word.chomp!

		# check if the word is a proper noun
		# store a value as true, false, or unknown depending on if the word is a proper know / starts with a capital letter
		if word.capitalize!.class == NilClass  # returned nil means no change made and therefore already capitalized
			$dictionary_hash.store(word.downcase, "proper")
		else
			$dictionary_hash.store(word.downcase, "common")
		end
	end
	# close the file when it is done loading
	dictionary_file.close
end

# main method that the user will interact with, which uses the dictionary that has already been loaded in
def search
	print "Please enter a word or scrambled word to find its anagrams:\n"
	word_in = gets.chomp.downcase
	# generate the permutations with our function by using the word as an array or characters for input
	perms = get_permutations(to_array(word_in))
	# remove duplicate values using uniq if they are found, to ensure that duplicate matches are not printed twice for words with two or more of the same letter
	perms.uniq!
	#print "Permutations of that word are as follows:\n#{perms}\n"
	
	# search the dictionary for the permutations to see if any of them is a word
	perms.each do |perm|
		if $dictionary_hash.has_key?(perm)
			# capitalize the first letter if the word is a proper noun
			if $dictionary_hash.fetch(perm) == "proper"
				perm.capitalize!
			end
			# print the match if found
			print "Match found: #{perm}\n"
		end
	end
	# restart the program without having to load the dictionary again
	search
end

# start the program with a welcome message, then load in the dictionary and begin the first search
print "Welcome to the word unscrambler and anagram tool!\n"
load_dictionary
search