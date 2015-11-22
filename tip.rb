print "Enter amount of bill: "
amount = gets.chomp.to_f

tip = amount * 0.10;
if tip < 1.00
	tip = 1.00
end
print "Tip amount: #{tip.round(2)}.\n"


=begin

a = 5.0 < 2.5
b = true
c = "dog" == "dog"
d = a && b
print "a: #{a}, b: #{b}, c: #{c}, d: #{d}, \n"
print c || d, c && d, "\n"

sum = 0.0
for count in 0..10000
	sum = sum + rand(10)
end
print "Average = #{(sum / 10000).round(4)}.\n"

s = "test" * 3
puts s
puts s.length
puts s.upcase
puts s.capitalize
print s.length, " ", s.upcase, " ", s.capitalize,"\n"
# % templating/replacing can also be used
print "#{s.length} #{s.upcase} #{s.capitalize}\n"

print "s as float: ", s.to_f, "\n"

x = "3423.827"
print x.to_f + 1.0
=end