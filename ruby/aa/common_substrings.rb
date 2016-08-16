def common_substrings(str1, str2)
  longest_substring = ""

  start_idx = 0
  while start_idx < str1.length
    len = longest_substring.length + 1
    while start_idx + len <= str1.length
      substring = str1[start_idx, len]
      if str2.include?(substring)
        longest_substring = substring
      end

      len += 1
    end

    start_idx += 1
  end

  longest_substring
end

p common_substrings("aweighflskjdghsd", "eigksjdfa;lks")
