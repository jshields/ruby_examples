
# one line at a time
fin = File.open("cinderella.txt", "r")
fout = File.open("cin1.txt", "w")
while line = fin.gets
  fout.print line.upcase
end
fin.close
fout.close

#One character at a time. Ans:
fin = File.open("cinderella.txt", "r")
fout = File.open("cin2.txt", "w")
while char = fin.getc
  fout.print char.upcase
end
fin.close
fout.close

#The entire contents of the file at once. Ans:
fin = File.open("cinderella.txt", "r")
fout = File.open("cin3.txt", "w")
story = fin.read
fout.print story.upcase
fin.close
fout.close