# Josh Shields, IT211 Project 1, 4/8/2015
#Define a method that calculates a monthly loan payment
def loan_calc()
	# Initialize variables
	p = 0 # - Principal
	r = 0 # - Rate of interest
	n = 0 # - Number of years

	# Get the input from the user as floats
	# - Get principal amount / loan amount
	while p <= 0 do
		print "Please enter principal amount for loan (must be a positive number):\n"
		p = gets.chomp.to_f
	end

	# - Get rate of interest in percent
	while r <= 0 do
		print "Please enter interest rate for loan (must be a positive number):\n"
		r = gets.chomp.to_f
	end

	# - Get number of years / the duration of the loan
	while n <= 0 do
		print "Please enter duration of the loan in years (must be a positive number):\n"
		n = gets.chomp.to_f
	end

	# Calculate the monthly payment for the loan
	m = (p * r / 1200) / (1 - (1.0 + r / 1200.0) ** (-12 * n))

	# Round to the nearest cent
	m = m.round(2)

	# Give the user their output
	print "This is the monthly payment for the loan, rounded to the nearest cent:\n", m, "\n"
	
	# Make another call to this same function if the user answered 'Y' for yes, exit if 'N' for no, or prompt again if input is invalid 
	answer = ""
	while answer != 'y' and answer != 'n' do
		print "Would you like to go again? Y/N\n"
		answer = gets.chomp.downcase
		if (answer == 'y')
			loan_calc()
		elsif (answer == 'n')
			return
		else
			print "Sorry, that doesn't seem to be a valid response. Only type 'Y' or 'N'\n"
		end
	end
end

# Call the method for the first time, after it is defined above
loan_calc()