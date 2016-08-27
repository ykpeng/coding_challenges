function anagramString(str1, str2){
  str1 = getLetters(str1);
  str2 = getLetters(str2);

  const freqs = {};
  for (let i = 0; i < str1.length; i++) {
    freqs[str1[i]] = freqs[str1[i]] || 0;
    freqs[str1[i]] += 1;
  }
  for (let i = 0; i < str2.length; i++) {
    freqs[str2[i]] = freqs[str2[i]] || 0;
    freqs[str2[i]] -= 1;
    if (freqs[str2[i]] < 0) {
      return false;
    }
  }

  return true;
}

function getLetters(str) {
  const ALPHA = new Set();
  for (let i = "a".charCodeAt(); i <= "z".charCodeAt(); i++) {
    ALPHA.add(String.fromCharCode(i));
  }

  const res = [];
  for (let i = 0; i < str.length; i++) {
    let downcased = str[i].toLowerCase();
    if (ALPHA.has(downcased)) {
      res.push(downcased);
    }
  }
  return res;
}

console.log(anagramString("Eleven plus two", "Twelve plus one"));
