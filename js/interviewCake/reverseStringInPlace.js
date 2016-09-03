function reverseStringInPlace(str){
  let arr = str.split("");
  const len = arr.length
  for (let i = 0; i < Math.floor(len / 2); i++) {
    [arr[i], arr[len - i - 1]] = [arr[len - i - 1], arr[i]];
  }
  return arr.join("");
}
