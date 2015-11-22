
choice_hash = {"rock"=>0, "paper"=>1, "scissors"=>2, "lizard"=>3, "spock"=>4}

ex_answer = "rock"
ex_bad_answer = "sponge"

print choice_hash[ex_answer], "\n"
print choice_hash[ex_bad_answer], "\n"
print choice_hash[ex_bad_answer].class, "\n"

if (choice_hash[ex_bad_answer].class == NilClass)
	puts "bad choice is nil"
end

#if (choice_hash["rock"])
	