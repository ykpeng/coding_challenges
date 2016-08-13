// Given two sorted arrays, find the median element amongst the two arrays. That is, if both arrays were combined, find the median element from the combined array. Assume that there is not enough memory to actually combine both arrays. There exists an O(log n + log m) solution.

function median(arr1, arr2){
  let arr1_idx = Math.floor(arr1.length / 2);
  let arr2_idx = Math.floor(arr2.length / 2);

  if (arr1[arr1_idx] === arr2[arr2_idx]) {
    return arr1[arr1_idx];
  } else if (arr1[arr1_idx] < arr2[arr2_idx]) {
    return median(arr1.slice(arr1_idx), arr2.slice(0, arr2_idx + 1));
  } else {
    return median(arr1.slice(0, arr1_idx + 1), arr2.slice(arr2_idx));
  }
}
