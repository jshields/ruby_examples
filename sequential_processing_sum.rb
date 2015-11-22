print "Enter a list of float numbers to sum.\nTerminate list with Ctrl + Z"

sum = 0
input = gets

while input != nil
	number = input.chomp.to_f
	sum += number
	input = gets
end

print "Sum is: ", sum, "\n"