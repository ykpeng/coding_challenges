function wordCloud(str){
  let alpha = generateAlpha();
  const freqs = {};

  let currWord = "";
  for (let i = 0; i < str.length; i++) {
    let char = str[i];
    if (!(alpha.has(char) || char === "-")) {
      if (currWord !== "") {
        freqs[currWord] = freqs[currWord] || 0;
        freqs[currWord]++;
      }
      currWord = "";
    } else if (alpha.has(char)){
      currWord = currWord.concat(char.toLowerCase());
    } else {
      currWord = currWord.concat(char);
    }
  }

  return freqs;
}

function generateAlpha(){
  const alpha = new Set();
  for (var i = "a".charCodeAt(); i < "z".charCodeAt(); i++) {
    alpha.add(String.fromCharCode(i));
  }
  for (var i = "A".charCodeAt(); i < "Z".charCodeAt(); i++) {
    alpha.add(String.fromCharCode(i));
  }
  return alpha;
}

console.log(wordCloud("We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake."));
