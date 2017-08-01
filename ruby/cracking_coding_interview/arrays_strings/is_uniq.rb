# Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

# brute force
# time: O(n)
# space: O(n)
require 'set'
def is_uniq1(string)
  seen = Set.new

  string.each_char do |chr|
    if seen.include?(chr)
      return false
    else
      seen << chr
    end
  end

  true
end

# puts is_uniq1("sdfghjk")
# puts is_uniq1("shshshssh")

# time: O(nlogn)
# space: O(1)
def is_uniq2(string)
  sorted = string.chars.sort
  sorted.each_cons(2) do |a, b|
    if a == b
      return false
    end
  end
  true
end

# puts is_uniq2("sdfghjk")
# puts is_uniq2("shshshssh")

def is_uniq3(string)
  return false if string.length > 128
  
  chars = Array.new(128, false)

  string.chars do |char|
    idx = char.ord
    if chars[idx]
      return false
    else
      chars[idx] = true
    end
  end

  true
end

puts is_uniq3("sdfghjk")
puts is_uniq3("shshshssh")
