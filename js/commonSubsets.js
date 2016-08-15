function commonSubsets(arr1, arr2){
  return subsets(intersection(arr1, arr2));
}

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

function intersection(arr1, arr2) {
  const freqs = {};
  const res = [];

  arr1.forEach(el => {
    freqs[el] = freqs[el] || 0;
    freqs[el] += 1;
  })

  arr2.forEach(el => {
    if (freqs[el] > 0) {
      res.push(el);
      freqs[el] -= 1;
    }
  })

  return res;
}

let arr1 = [1,2,2,3,4];
let arr2 = [1,2,2,5,6]
console.log(commonSubsets(arr1, arr2));
