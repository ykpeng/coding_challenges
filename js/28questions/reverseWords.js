function reverseWords(str) {
  let arr = str.split("");
  let start = 0;
  let end = str.length;
  reverseCharacters(arr, start, end);

  for (let i = 0; i < arr.length; i++) {
    if (i + 1 === arr.length || arr[i + 1] === " ") {
      end = i + 1;
      reverseCharacters(arr, start, end);
      start = end + 1;
    }
  }
  return arr.join("");
}

function reverseCharacters(arr, start, end) {
  let mid = Math.floor((end - start) / 2);
  for (let i = 0; i < mid; i++) {
    [arr[start + i], arr[end - 1 - i]] = [arr[end - 1 - i], arr[start + i]];
  }
  return arr;
}

console.log(reverseWords("cats are the best"));
