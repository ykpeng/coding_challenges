function generateParens(n) {
  if (n === 0) {
    return new Set([""]);
  }

  const parens = new Set();

  let prevParens = generateParens(n - 1);
  prevParens.forEach((str)=>{
    for (let i = 0; i <= str.length; i++) {
      let newStr = str.slice(0, i).concat("()").concat(str.slice(i));
      parens.add(newStr);
    }
  })

  return parens;
}

console.log(generateParens(3));
