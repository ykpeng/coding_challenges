def caesar_cipher(str, shift)
  res = ""
  str.each_byte do |byte|
    if byte != " ".ord
      new_byte = (byte - "a".ord + shift) % 26 + "a".ord
      new_char = new_byte.chr
      res << new_char
    else
      res << " "
    end
  end

  res
end

p caesar_cipher("hello kitty", 3)
