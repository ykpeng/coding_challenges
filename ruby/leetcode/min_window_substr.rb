# Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
# 
# For example,
# S = "ADOBECODEBANC"
# T = "ABC"
# Minimum window is "BANC".
# 
# Note:
# If there is no such window in S that covers all characters in T, return the empty string "".
# 
# If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S.

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  need = Hash.new { |h, k| h[k] = 0 }
  found = Hash.new { |h, k| h[k] = 0 }
  t.chars do |letter|
    need[letter] += 1
  end
  
  count = 0
  start = 0
  i, j = 0, 0
  distance = 1.0/0
  
  while j < s.length
    if need[s[j]] > 0
      if found[s[j]] < need[s[j]]
        count += 1
      end
      found[s[j]] += 1
      
      while i < j
        if need[s[i]] <= 0
          i += 1
          next
        end
        
        break if count != t.length
        
        curr_distance = j - i + 1
        if curr_distance < distance
          distance = curr_distance
          start = i
        end
    
        found[s[i]] -= 1
        if found[s[i]] < need[s[i]]
          count -= 1
        end
        
        i += 1
      end
    end
    
    j += 1
  end
  
  if distance == 1.0/0
    return ""
  end
  
  s[start, distance]
end

s = "ADOBECODEBANC"
t = "ABC"
p min_window(s, t)