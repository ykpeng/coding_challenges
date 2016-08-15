function subsets(arr) {
  if (arr.length === 0) {
    return [[]];
  }
  const lastSubs = subsets(arr.slice(0, arr.length - 1));
  const newSubs = lastSubs.map(sub => {
    return sub.concat(arr[arr.length - 1]);
  })
  return lastSubs.concat(newSubs);
}

let arr = [1,2,3,4,5]
console.log(subsets(arr));
