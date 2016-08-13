function commonSubstrings(str1, str2) {
  let longestSubstring = "";

  let startIdx = 0;
  while (startIdx < str1.length) {
    let len = longestSubstring.length + 1;

    while ((startIdx + len) <= str1.length) {
      let endIdx = startIdx + len;
      let substring = str1.slice(startIdx, endIdx);
      if (str2.includes(substring)) {
        longestSubstring = substring;
      }

      len++
    }

    startIdx++
  }

  return longestSubstring;
}


console.log(commonSubstrings("asdkfjalskbnghffh", "abngasdfd"));
