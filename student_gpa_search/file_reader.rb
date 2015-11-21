
fin = File.open(".txt", "r")
# throw away top line of file, just the column header
gets

count = 0

while line = gets
	fields = line.chomp.split(",");
	gender = fields[1]
	salary = fields[4]
	if gender == "F" && salary >= 70000
		count+=1
	end
end

print "There are #{count} women with a salary more than $70,000.\n"