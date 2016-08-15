function longestPalindome(str) {
  let longest = 0;
  let start = 0;

  // odd palins
  for (let i = 0; i < str.length; i++) {
    let step = 1;

    while ((i - step) >= 0 && (i + step) < str.length && str[i - step] === str[i + step]) {
      let currLen = step * 2 + 1;
      if (currLen > longest) {
        longest = currLen;
        start = i - step;
      }
      step++
    }
  }

  // even palins
  for (let i = 0; i < str.length; i++) {
    let leftStep = 1;
    let rightStep = 0;

    while ((i - leftStep) >= 0 && (i + rightStep) < str.length && str[i - leftStep] === str[i + rightStep]) {
      let currLen = leftStep + rightStep + 1;
      if (currLen > longest) {
        longest = currLen;
        start = i - leftsStep;
      }
      leftStep++
      rightStep++
    }
  }

  return [start, start + longest - 1];
}

console.log(longestPalindome("babcbabcbaccba"));
