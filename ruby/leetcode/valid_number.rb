# Validate if a given string is numeric.
# 
# Some examples:
# "0" => true
# " 0.1 " => true
# "abc" => false
# "1 a" => false
# "2e10" => true
# Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one.

# @param {String} s
# @return {Boolean}
def is_number(s)
  digits = %w(0 1 2 3 4 5 6 7 8 9)
  
  e_split = s.split("e")
  return false if e_split.length > 2
end