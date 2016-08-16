function caesarCipher(str, shift){
  let res = "";
  for (let i = 0; i < str.length; i++) {
    if (str[i] !== " ") {
      let newCharCode = ((str[i].charCodeAt() - "a".charCodeAt()) + shift) % 26 + "a".charCodeAt()
      let newChar = String.fromCharCode(newCharCode);
      res = res.concat(newChar);
    } else {
      res = res.concat(" ");
    }
  }
  return res;
}

console.log(caesarCipher("hello kitty", 3));
console.log(caesarCipher("zzx", 3));
