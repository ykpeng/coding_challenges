function foldingCipher(str) {
  const alpha = alphabet();
  const reversed = alpha.slice(0).reverse();

  const foldedAlpha = {};
  for (let i = 0; i <= 26; i++) {
    foldedAlpha[alpha[i]] = reversed[i]
  }

  let encoded = [];
  for (let i = 0; i < str.length; i++) {
    encoded.push(foldedAlpha[str[i]])
  }
  return encoded.join("");
}

function alphabet(){
  const alpha = [];
  const startByte = "a".charCodeAt();
  const endByte = "z".charCodeAt();
  for (let i = startByte; i <= endByte; i++) {
    let letter = String.fromCharCode(i);
    alpha.push(letter);
  }
  return alpha;
}

console.log(foldingCipher("hello"));
