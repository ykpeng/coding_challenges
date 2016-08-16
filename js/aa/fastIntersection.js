function fastIntersection(arr1, arr2){
  const freqs = {};
  const intersection = [];

  arr1.forEach(el => {
    freqs[el] = freqs[el] || 0;
    freqs[el] += 1;
  })

  arr2.forEach(el => {
    if (freqs[el] && freqs[el] > 0) {
      intersection.push(el)
      freqs[el] -= 1;
    }
  })

  return intersection;
}

let arr1 = [1,2,2,3,4,4,4];
let arr2 = [2,2,2,3,4];

console.log(fastIntersection(arr1, arr2));
