# Write a method to compute all the permutations of a string of unique characters.

# time: n^2 * n! ?
# space:
def perms(str)
  if str.length < 2
    return str
  end

  prev_perms = perms(str[0...-1])
  last_char = str.last
  new_perms = []
  prev_perms.each do |perm|
    0.upto(perm.length) do |i|
      new_perms << perm[0...i] + last_char + perm[i..-1]
    end
  end
end
