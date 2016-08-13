function fibs(num){
  let currFibs = [0, 1];
  if (num <= 2) {
    return currFibs.slice(0, num + 1);
  }
  const lastFibs = fibs(num - 1);
  const lastFibsLen = lastFibs.length;
  const newFib = lastFibs[lastFibsLen - 1] + lastFibs[lastFibsLen - 2];
  lastFibs.push(newFib);
  return lastFibs;
}

function fibs_iter(num) {
  let currFibs = [0, 1];
  if (num <= 2) {
    return currFibs.slice(0, num + 1);
  }

  while (currFibs.length < num) {
    let len = currFibs.length;
    currFibs.push(currFibs[len - 1] + currFibs[len - 2]);
  }

  return currFibs;
}

console.log(fibs_iter(0));
console.log(fibs_iter(1));
console.log(fibs_iter(2));
console.log(fibs_iter(7));
