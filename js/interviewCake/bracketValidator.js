function bracketValidator(str){
  const openers = new Set (["(", "{", "["]);
  const closers = new Set ([")", "}", "]"]);
  const matches = { "(": ")", "{": "}", "[": "]" };
  const stack = [];

  for (let i = 0; i < str.length; i++) {
    if (openers.has(str[i])) {
      stack.push(str[i]);
    } else if (closers.has(str[i])){
      if (stack.length === 0) {
        return false;
      }
      let opener = stack.pop();
      if (str[i] !== matches[opener]) {
        return false;
      }
    }
  }

  return stack.length === 0;
}
