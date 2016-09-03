function permutationPalin(str) {
  let odds = new Set();
  str.forEach(letter => {
    if (odds.has(letter)) {
      odds.delete(letter);
    } else {
      odds.add(letter);
    }
  })
  return odds.size < 2;
}
