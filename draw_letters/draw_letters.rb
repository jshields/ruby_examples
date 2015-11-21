# Draw 2 Letters / Project 4 by Josh Shields, IT 211
# Letter assignment C, Y
# Part 1
# Draw letters to console

# Draw C
for y in 1..10
  for x in 1..(((15-(y-1))*2)/(y+1))
    print " "
  end
  for x in 1..6
    print "*"
  end
  print "\n"
end
for y in 6..15
  for x in 1..((y*2)/((15-(y-1))+1))
    print " "
  end
  for x in 1..6
    print "*"
  end
  print "\n"
end

# space out the letters
print "\n\n"

# Draw Y
# Draw diagonal
for y in 1..10
  for x in 1..(y)
    print " "
  end
  for x in 1..6
    print "*"
  end
  for x in 1..((10-y)*2)
    print " "
  end
  for x in 1..6
    print "*"
  end
  print "\n"
end

# Draw vertical bar
for y in 1..15
  for x in 1..13
    print " "
  end
  for x in 1..6
    print "*"
  end
  print "\n"
end

# Part 2
# Output to file
# Colors in RGB format
# Black background, white foreground
$total_width = 32

def print_graphics_file_header(ostream)
  ostream.print "P3 #{$total_width} 45 255\n"
end

def draw_background_pixel(ostream)
  ostream.print "0 0 0  "
end

def draw_foreground_pixel(ostream)
  ostream.print "255 255 255  "
end

def draw_margin_space(ostream)
  for y in 1..10
    for x in 1..$total_width
      draw_background_pixel(ostream)
    end
    ostream.print "\n"
  end
end

# Draw C to PPM
# open 'C' output file to draw result
fout = File.open("c_letter.ppm", "w")

def draw_c(ostream)
  for y in 1..10
    letter_width = 0
    for x in 1..(((15-(y-1))*2)/(y+1))
      ostream.print draw_background_pixel(ostream)
      letter_width+=1
    end
    for x in 1..6
      ostream.print draw_foreground_pixel(ostream)
      letter_width+=1
    end
    for x in 1..($total_width - letter_width)
        draw_background_pixel(ostream)
    end
    ostream.print "\n"
  end
  for y in 6..15
    letter_width = 0
    for x in 1..((y*2)/((15-(y-1))+1))
      ostream.print draw_background_pixel(ostream)
      letter_width+=1
    end
    for x in 1..6
      ostream.print draw_foreground_pixel(ostream)
      letter_width+=1
    end
    for x in 1..($total_width - letter_width)
        draw_background_pixel(ostream)
    end
    ostream.print "\n"
  end
end

print_graphics_file_header(fout)
draw_margin_space(fout)
draw_c(fout)
draw_margin_space(fout)
#close the output file before the program completes
fout.close

# Draw Y to PPM
# open 'Y' output file to draw result
fout = File.open("y_letter.ppm", "w")
def draw_y(ostream)
	# Draw diagonal
	for y in 1..10
    letter_width = 0
	  for x in 1..(y)
	    draw_background_pixel(ostream)
      letter_width+=1
	  end
	  for x in 1..6
	    draw_foreground_pixel(ostream)
      letter_width+=1
	  end
	  for x in 1..((10-y)*2)
	    draw_background_pixel(ostream)
      letter_width+=1
	  end
	  for x in 1..6
	    draw_foreground_pixel(ostream)
      letter_width+=1
	  end
    for x in 1..($total_width - letter_width)
      draw_background_pixel(ostream)
    end
	  ostream.print "\n"
	end

	# Draw vertical bar
	for y in 1..15
	  for x in 1..13
	    draw_background_pixel(ostream)
	  end
	  for x in 1..6
	    draw_foreground_pixel(ostream)
	  end
    for x in 1..($total_width - 19)
      draw_background_pixel(ostream)
    end
	  ostream.print "\n"
	end
end

print_graphics_file_header(fout)
draw_margin_space(fout)
draw_y(fout)
draw_margin_space(fout)
#close the output file before the program completes
fout.close