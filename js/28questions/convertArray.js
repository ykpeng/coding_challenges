function getIndex(currIdx, n) {
  return (currIdx % 3) * n + currIdx / 3;
}

function convertArray(arr){
  const n = arr.length / 3;
  for (let currIdx = 0; currIdx < arr.length; currIdx++) {
    let swapIdx = getIndex(currIdx, n);
    while (swapIdx < currIdx) {
      swapIdx = getIndex(swapIdex, n);
    }
    [arr[currIdx], arr[swapIdx]] = [arr[swapIdx], arr[currIdx]];
  }
}
