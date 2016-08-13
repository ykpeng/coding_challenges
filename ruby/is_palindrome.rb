def is_palindrome(str)
  len = str.length
  (0...len / 2).each do |i|
    return false if str[i] != str[len - 1 - i]
  end

  true
end

p is_palindrome("abcdedcba")
p is_palindrome("abcdeedcba")
p is_palindrome("asldghdl")
