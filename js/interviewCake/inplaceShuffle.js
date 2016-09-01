function getRandom(floor, ceiling) {
  return Math.floor(Math.random() * (ceiling - floor)) + floor;
}

function inplaceShuffle(arr){
  const len = arr.length;
  if (len <= 1) {
    return;
  }
  for (let i = 0; i < len; i++) {
    let randIdx = getRandom(i, len);
    [arr[i], arr[randIdx]] = [arr[randIdx], arr[i]];
  }
  return arr;
}

console.log(inplaceShuffle([1,2,3,4,5,6]));
