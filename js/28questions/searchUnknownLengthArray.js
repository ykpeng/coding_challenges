function getIndex(arr, target){
  let idx = 0;
  let exp = 0;

  while (true) {
    try {
      if (arr[idx] === target) {
        return idx;
      } else if (arr[idx] < target) {
        idx = 2**exp;
        exp += 1;
      } else {
        break;
      }
    } catch (e) {
      break;
    }
  }

  let left = Math.floor(idx / 2) + 1;
  let right = idx - 1;
  let mid;
  while (left <= right) {
    try {
      mid = left + (right - left) / 2;
      if (arr[mid] === target) {
        return mid;
      } else if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    } catch (e) {
      right = mid - 1;
    }
  }

  return -1;
}
