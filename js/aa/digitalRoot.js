function digitalRoot(num) {
  let dRoot = num;
  while (dRoot > 9) {
    dRoot = sumNum(dRoot);
  }
  return dRoot;
}

function sumNum(num) {
  let sum = 0;
  while (num > 0) {
    sum += num % 10;
    num = Math.floor(num / 10);
  }
  return sum;
}

console.log(digitalRoot(12345));
console.log(digitalRoot(345));
