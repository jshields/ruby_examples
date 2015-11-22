# celcius to fahrenheit
# convert temperatures

print "Enter a Celcius temperature: "
cel = gets.chomp.to_f
fahr = 9.0 * cel / 5.0 + 32.0
print "The corresponding Fahrenheit temperature is ", fahr, ".\n"