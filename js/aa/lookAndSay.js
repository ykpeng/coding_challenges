function lookAndSay(arr){
  if (arr.length === 0) {
    return [];
  }

  let res = [[1, arr[0]]];

  for (let i = 1; i < arr.length; i++) {
    if (arr[i] === arr[i - 1]) {
      res[res.length - 1][0]++;
    } else {
      res.push([1, arr[i]]);
    }
  }

  return res;
}

console.log(lookAndSay([1, 2, 1, 1]));
