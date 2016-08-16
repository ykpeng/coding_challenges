function checkPermutation(str1, str2) {
  if (str1.length !== str2.length) {
    return false;
  }

  const freqs = new Array(128).fill(0);

  for (let i = 0; i < str1.length; i++) {
    let charCode = str1[i].charCodeAt();
    freqs[charCode]++;
  }

  for (let j = 0; j < str2.length; j++) {
    let charCode = str2[j].charCodeAt();
    freqs[charCode]--;
    if (freqs[charCode] < 0) {
      return false;
    }
  }

  return true;
}

console.log(checkPermutation("abcd", "dabc"));
console.log(checkPermutation("aaab", "dabc"));
