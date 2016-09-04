function removeDups (str) {
  let res = [];
  let seen = new Set();

  for (let i = 0; i < str.length; i++) {
    let curr = str[i];
    if (!seen.has(curr)) {
      res.push(curr);
      seen.add(curr);
    }
  }

  return res.join("");
}
