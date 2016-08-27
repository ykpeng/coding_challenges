function firstNonRepeatedChar(str){
  const freqs = {};
  for (let i = 0; i < str.length; i++) {
    freqs[str[i]] = freqs[str[i]] || 0;
    freqs[str[i]] += 1;
  }

  for (let i = 0; i < str.length; i++) {
    if (freqs[str[i]] === 1) {
      return str[i];
    }
  }
}
