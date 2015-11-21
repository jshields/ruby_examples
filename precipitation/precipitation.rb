# Shields P7
# Write a script that reads data from the XML file weather.xml, converting it to a Hash object
# Compute the total precipitation for a month that is input by the user
# Before running this example on your computer, install the
# xml-simple Ruby Gem like this:
# gem install xml-simple

require 'xmlsimple'

months = {"january"=>1, "february"=>2, "march"=>3, "april"=>4, "may"=>5, "june"=>6, "july"=>7, "august"=>8, "september"=>9, "october"=>10, "november"=>11, "december"=>12};

# Open data file.
fin = File.open('weather.xml', 'r')

# Read entire Xml file.
weather_xml_data = fin.read

# Convert Xml data to a hash object.
weather_hash = XmlSimple.xml_in(weather_xml_data, 'ForceArray' => false)

# Extract the array of one-day-summary hash objects.
records_array = weather_hash["one-day-summary"]

# make sure that the user enters a valid month when they are prompted, otherwise repeat
month_id = 0
while month_id == 0
  print "Enter a month of the year to get total precipitation:\n"
  # Enter month at the keyboard.
  month = gets.chomp.downcase
  month_integer_input = month.to_i
  month_name = ""
  
  # determine whether the user is searching by month number or name
  if month_integer_input == 0
    months.each_key do |m|
      if m.include?(month)
        month_id = months.fetch(m)
        month_name = m.capitalize
        print "Found month by name: #{month_name}.\n"
      end
    end
  elsif (1..12) === month_integer_input
    month_id = month_integer_input
    month_name = months.key(month_id).capitalize
    print "Found month by number: #{month_id} (#{month_name}).\n"
  else
    month_id = 0
    print "Sorry, invalid month input.\nPlease try again with a Gregorian month name or a number 1 through 12.\n"
  end
end

# Now that we have the month, we can add up the precipitation values
# Initialize summary variables.
total_precipitation = 0.0

# Search for records that match month, updating
# the summary variable for precipitation as you go.
records_array.each do |r|
  # print r["id"], "\n"
  if r["precip"] && r["month"].to_i == month_id
    precip = r["precip"].to_f
    total_precipitation += precip
  end
end

print "Total precipitation for #{month_name} is #{total_precipitation}"