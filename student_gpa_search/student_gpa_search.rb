# Student Records / Project 3 by Josh Shields, IT 211
# Goal:   Compute student GPAs from student records. 
# Input:   First and last name of desired student; student records for all students, redirected from student-records.txt. Enter desired first and last name at the keyboard (STDIO). 
# Output: GPA of desired student.
print "Welcome to the GPA calculator. Search by student first and last name.\n"

# Initialize our starting variables
# read desired_first_name from keyboard
print "Please enter first name:\n"
desired_first_name = gets.chomp.capitalize

# read desired_last_name from keyboard
print "Please enter last name:\n"
desired_last_name = gets.chomp.capitalize
print "Searching for #{desired_first_name} #{desired_last_name}.\n"

# initialize $total_credit_hours to 0.0
$total_credit_hours = 0.0

# initialize $total_grade_points to 0.0
$total_grade_points = 0.0

# -- Open the file and read its records row by row, looking for matches in records for the name of the student that the user searched for --
# open input file to create file object fin
# Note: student-records.txt file is required in the same directory, provided with this assignment
fin = File.open("student-records.txt", "r")

# throw away top line of file, it's just the column header
fin.gets

# use a varialbe to represent whether a match was ever found, and let the user know if there were no results to their search
$found = false

# while there are more line(s)
while line = fin.gets
	# use split function to extract fields from line
	fields = line.chomp.split(",");

	# assign these variables values from fields array: last_name, first_name, credit_hours, grade
	last_name = fields[1]
	first_name = fields[2]

	#use to_i for credit_hours
	credit_hours = fields[6].to_i
	grade = fields[7]

	#testing
	#print fields, "credit_hours: ", credit_hours, " grade: ", grade, "\n"

	# If the current record on each of the records matches the student we are looking for, take that record into the result
    if first_name == desired_first_name && last_name == desired_last_name
    	$found = true
    	if grade == "A"
            grade_points = credit_hours * 4
        elsif grade == "B"
            grade_points = credit_hours * 3
        elsif grade == "C"
            grade_points = credit_hours * 2
        elsif grade == "D"
            grade_points = credit_hours * 1
        elsif grade == "F"
            grade_points = credit_hours * 0
        else
        	print "Something is wrong with the grade record for #{first_name} #{last_name}.\n"             
    	end        

		# update $total_credit_hours
		$total_credit_hours += credit_hours

		#update $total_grade_points
		$total_grade_points += grade_points
    end
end
# close the file when the operation is done
fin.close

# if there was no match, let the user know. Otherwise, compute the final result
if $found == false
	result = "Sorry, there does not seem to have been a match with your search for #{desired_first_name} #{desired_last_name}.\n"
else
	# Do the final calculations to get the resulting GPA based on the input we read, then print the results so the user can see them
	# compute gpa: $total_grade_points / $total_credit_hours
	gpa = ($total_grade_points / $total_credit_hours).round(2)
	result = "#{desired_first_name} #{desired_last_name}'s GPA is #{gpa}.\nThey earned #{$total_grade_points} grade points over #{$total_credit_hours} credit hours.\n"
end

# print result
print result

#open output file to write out result there as well [NOTE to grader: this is added functionality not in the instructions]
fout = File.open("#{desired_first_name}_#{desired_last_name}_result.txt", "w")
fout.print result
#close the output file before the program completes
fout.close