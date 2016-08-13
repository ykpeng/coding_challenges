def folding_cipher(str)
  # alpha = ("a".."z").to_a
  # reversed = alpha.reverse
  #
  # encoded = ""
  # str.chars do |char|
  #   idx = alpha.index(char)
  #   encoded << reversed[idx]
  # end
  #
  # encoded

  folded_alpha = Hash[("a".."z").zip(("a".."z").to_a.reverse)]
  str.chars.map { |char| folded_alpha[char] }.join
end

p folding_cipher("hello")
