function matchingParens(str, position){
  let cnt = 1;
  for (let i = position + 1; i < str.length; i++) {
    if (str[i] === "(") {
      cnt++;
    } else if (str[i] === ")") {
      cnt--;
    }
    if (cnt === 0) {
      return i;
    }
  }
  throw new Error("No matching parenthesis");
}
