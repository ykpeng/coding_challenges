function reverseWords(words){
  let arr = words.split("");

  reverse(arr, 0, arr.length - 1);
  let startIdx = 0;

  for (let i = 0; i < arr.length; i++) {
    if ((i + 1) === arr.length || arr[i + 1] === " ") {
      reverse(arr, startIdx, i);
      startIdx = i + 2;
    }
  }
  return arr.join("");
}

function reverse(arr, startIdx, endIdx) {
  while (startIdx < endIdx) {
    [arr[startIdx], arr[endIdx]] = [arr[endIdx], arr[startIdx]];
    startIdx++;
    endIdx--;
  }
  return arr;
}
