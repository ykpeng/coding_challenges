function checkBalancedParens(str) {
  if (str.length % 2 !== 0) {
    return false;
  }
  const stack = [];
  const opening = new Set(["(", "[", "{"]);
  const match = { "(": ")", "[": "]", "{": "}" };

  for (let i = 0; i < str.length; i++) {
    if (opening.has(str[i])) {
      stack.push(str[i]);
    } else {
      let bracket = stack.pop();
      if (match[bracket] !== str[i]) {
        return false;
      }
    }
  }
  return stack.length === 0;
}

console.log(checkBalancedParens("({[]})"));
console.log(checkBalancedParens("({[)]})"));
