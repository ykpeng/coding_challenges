function binarySearch(arr, target) {
  if (arr.length === 0) {
    return null;
  }

  const midIdx = Math.floor(arr.length / 2);

  if (target === arr[midIdx]) {
    return midIdx;
  } else if (target < arr[midIdx]) {
    return binarySearch(arr.slice(0, midIdx), target);
  } else {
    let idx = binarySearch(arr.slice(midIdx + 1), target);
    if (idx !== null) {
      return (idx + midIdx + 1);
    } else {
      return null;
    }
  }
}

function bSearch(arr, i, j, target) {
  if (i === j) {
    return null;
  }

  const midIdx = Math.floor((i + j) / 2);

  if (target === arr[midIdx]) {
    return midIdx;
  } else if (target < arr[midIdx]) {
    return bSearch(arr, i, midIdx, target);
  } else {
    return bSearch(arr, midIdx + 1, j, target);
  }
}

console.log(bSearch([1, 2, 3], 0, 3, 1) )
console.log(bSearch([2, 3, 4, 5], 0, 4, 3) )
console.log(bSearch([2, 4, 6, 8, 10], 0, 5, 6) )
console.log(bSearch([1, 3, 4, 5, 9], 0, 5, 5))
console.log(bSearch([1, 2, 3, 4, 5, 6], 0, 6, 6))
console.log(bSearch([1, 2, 3, 4, 5, 6], 0, 6, 0) )
console.log(bSearch([1, 2, 3, 4, 5, 7], 0, 6, 6))
