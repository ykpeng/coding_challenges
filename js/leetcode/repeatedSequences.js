function repeatedSequences (str) {
  let seen = new Set();
  let repeated = new Set();

  for (let i = 0; i + 10 <= str.length; i++) {
    let subStr = str.slice(i, i + 10);
    if (seen.has(subStr)) {
      repeated.add(subStr);
    } else {
      seen.add(subStr);
    }
  }

  return Array.from(repeated);
}

console.log(repeatedSequences("AAAAAAAAAAAA"));
