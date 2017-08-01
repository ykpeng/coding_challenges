# Assume you have a method is_substring which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to is_substring (e.g., "waterbottle" is a rotation of "erbottlewat").

def is_rotation(s1, s2)
  return false if s1.length != s2.length
  return false if s1.length == 0

  long_str = s1 + s1
  if is_substring(long_str, s2)
    return true
  end
  false
end
