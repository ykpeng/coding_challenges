function fib1(n) {
  const res = [0, 1];
  if (n < 2) {
    return res[n];
  }
  while (res.length <= n) {
    let newFib = res[res.length - 1] + res[res.length -2];
    res.push(newFib);
  }
  return res[res.length - 1];
}

function fib2(n) {
  let res = [0, 1];

  if (n < 2) {
    return res[n];
  }

  let idx = 1;
  while (idx < n) {
    let newFib = res[0] + res[1];
    res[0] = res[1];
    res[1] = newFib;
    idx++;
  }
  return res[1];
}

function fib3(n) {
  if (n < 0) {
    throw new Error("Index can't be negative");
  } else if (n < 2) {
    return n;
  }

  let a = 0;
  let b = 1;
  let c = a + b;
  while (n > 2) {
    a = b;
    b = c;
    c = a + b;
    n--;
  }
  return c;
}

console.log(fib3(0));
console.log(fib3(1));
console.log(fib3(2));
console.log(fib3(3));
console.log(fib3(4));
console.log(fib3(5));
