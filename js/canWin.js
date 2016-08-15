function canWin(arr, idx){
  const seen = new Set;
  const queue = [idx];
  while (queue.length > 0) {
    currIdx = queue.shift();
    currVal = arr[currIdx];
    if (currVal === 0) {
      return true;
    }
    let left = idx - currVal;
    let right = idx + currVal;
    if (left >= 0 && !seen.has(left)){
      queue.push(left);
    }
    if (right < arr.length && !seen.has(right)){
      queue.push(right);
    }
    seen.add(currIdx);
  }
  return false;
}

console.log(canWin([3,2,1,0,2,1,2], 6));
