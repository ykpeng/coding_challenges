function mergeSort(arr) {
  if (arr.length < 2) {
    return arr;
  }
  const midIdx = Math.floor(arr.length / 2);
  const left = mergeSort(arr.slice(0, midIdx));
  const right = mergeSort(arr.slice(midIdx));
  return merge(left, right);
}

function merge(left, right) {
  const merged = [];
  let i = 0;
  let j = 0;

  while (i !== left.length && j !== right.length) {
    if (left[i] < right[j]) {
      merged.push(left[i]);
      i++
    } else {
      merged.push(right[j]);
      j++
    }
  }

  while (i !== left.length) {
    merged.push(left[i]);
    i++
  }

  while (j !== right.length) {
    merged.push(right[j]);
    j++
  }

  return merged;
}

console.log(mergeSort([4,2,6,5,8,1]));
