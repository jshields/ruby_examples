# Caesar1 Example
# Sourcecode file in examples/fileio/caesar1.rb
def encode(key, infile_name, outfile_name)
	
  # Possible characters of plaintext message.
  letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
  # Length of key
  len = key.length

  # char_count is number of characters from start of message.  
  char_count = 0

  # Open File objects for input and output.
  infile = File.open(infile_name, "r")
  outfile = File.open(outfile_name, "w")
  
  while char = infile.getc
    if char_index = letters.index(char)
      key_index = char_count % len;
      key_char = key[key_index]
      offset = letters.index(key_char)
      new_char_index = (char_index + offset) % 26
      new_char = letters[new_char_index]
      outfile.print new_char
      char_count += 1
	    
	  # Use these two lines for debugging.
 	  # print char, " ", char_index, " ", key_index, " ", key_char, " ", 
 	  #       offset, " ", new_char_index, " ", new_char, "\n"
 	    
    elsif char == " " || char == "\n"
	  outfile.print char
	end
  end
    
  # Close files
  infile.close
  outfile.close
    
end

def decode(key, infile_name, outfile_name)
	
  # Possible characters of plaintext message.
  letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
  # Length of key
  len = key.length

  # char_count is number of characters from start of message.  
  char_count = 0

  # Open file objects for input and output.
  infile = File.open(infile_name, "r")
  outfile = File.open(outfile_name, "w")

  while char = infile.getc
    if char_index = letters.index(char)
	  key_index = char_count % len;
      key_char = key[key_index]
	  offset = letters.index(key_char);
	  new_char_index = (char_index + 26 - offset) % 26
	  new_char = letters[new_char_index]
	  outfile.print new_char
      char_count += 1
	    
	  # Use these two lines for debugging.
 	  # print char, " ", char_index, " ", key_index, " ", key_char, " ", 
 	  #       offset, " ", new_char_index, " ", new_char, "\n"
 	    
	elsif char == " " || char == "\n"
	  outfile.print char
	end
	
  end

  # Close files.
  infile.close
  outfile.close
  	
end

encode("QWERTY", "plaintext.txt", "encoded.txt")
decode("QWERTY", "encoded.txt", "decoded.txt")