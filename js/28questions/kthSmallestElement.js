function quicksort(arr, start = 0, end = arr.length) {
  if (end - start < 2) {
    return arr;
  }

  let pivotIdx = partition(arr, start, end);

  quicksort(arr, pivotIdx + 1, end);
  quicksort(arr, start, pivotIdx);

  return arr;
}

function partition(arr, start, end) {
  let pivotIdx = start;
  for (let i = start + 1; i < end; i++) {
    if (arr[i] < arr[pivotIdx]){
      [arr[i], arr[pivotIdx + 1]] = [arr[pivotIdx + 1], arr[i]];
      [arr[pivotIdx], arr[pivotIdx + 1]] = [arr[pivotIdx + 1], arr[pivotIdx]];

      pivotIdx++;
    }
  }
  return pivotIdx;
}

// console.log(quicksort([5,2,4,6,1]));

function kthSmallestElement(arr, k, start = 0, end = arr.length){
  if (arr.length < k) {
    return null;
  }
  if (end - start < 1) {
    return null;
  }

  let pivotIdx = partition(arr, start, end);

  if (pivotIdx === k) {
    return arr[pivotIdx];
  } else if (pivotIdx < k) {
    return kthSmallestElement(arr, k, pivotIdx + 1, end);
  } else {
    return kthSmallestElement(arr, k, start, pivotIdx);
  }
}

console.log(kthSmallestElement([3, 1, 2, 1, 4, 5], 5));
