function nextPalinNum(num){
  const leftHalf = getLeftHalf(num);
  const mid = getMiddle(num);
  const length = num.toString().length;
  let mirror = leftHalf.slice(0).reverse();
  let increment;
  if (length % 2 === 0) {
    increment = 10 ** Math.floor(length / 2);
    let newNum = leftHalf.concat(mirror);
  } else {
    increment = 1.1 * 10 ** Math.floor(length / 2);
    let newNum = leftHalf.concat(mid).concat(mirror);
  }

  if (newNum > num) {
    return newNum;
  }
  if (mid !== "9") {
    return newNum + increment;
  } else {
    return nextPalinNum(roundUp(num));
  }
}

function getLeftHalf(num){
  numS = num.toString();
  midIdx = Math.floor(numS.length / 2);
  return numS.slice(0, midIdx);
}

function getMiddle(num) {
  numS = num.toString();
  midIdx = Math.floor(numS.length / 2);
  return numS[midIdx]);
}

function roundUp(num){
  const length = num.toString().length;
  increment = 10 ** (Math.floor(length / 2) + 1);
  return (Math.floor(num / increment) + 1) * increment;
}

// TODO: review
