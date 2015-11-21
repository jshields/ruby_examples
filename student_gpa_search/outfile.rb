for i in 1..100
	outfile = File.open("number-files/"+ i.to_s + ".txt", "w")

	outfile.print i, "\n"

	outfile.close
end