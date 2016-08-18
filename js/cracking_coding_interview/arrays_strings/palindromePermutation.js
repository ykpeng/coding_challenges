function palindromePermutation(str){
  const joinedStr = str.replace(" ", "");

  const freqs = {};
  for (let i = 0; i < joinedStr.length; i++){
    let char = joinedStr[i].toLowerCase();
    freqs[char] = freqs[char] || 0;
    freqs[char]++;
  }

  let cntOdd = 0;
  for (key in freqs) {
    if (freqs[key] % 2 !== 0) {
      cntOdd++;
    }
  }

  return cntOdd < 2;
}

console.log(palindromePermutation("Tact Coa"));
console.log(palindromePermutation("Taoo Coa"));
