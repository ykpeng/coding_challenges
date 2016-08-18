function stringCompression (str) {
  const compressed = [];
  let cntConsecutive = 0;

  for (let i = 0; i < str.length; i++) {
    cntConsecutive++;
    if (i + 1 >= str.length || str[i] !== str[i + 1]) {
      compressed.push(str[i]);
      compressed.push(cntConsecutive);
      cntConsecutive = 0;
    }
  }

  return compressed.length < str.length ? compressed.join("") : str;
}

console.log(stringCompression("aabcccccaaa"));
