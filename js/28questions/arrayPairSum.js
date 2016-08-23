//O(N) time
//O(N) space
function arrayPairSum(nums, k){
  const seen = new Set();
  const pairs = {};

  nums.forEach((num)=>{
    let target = k - num;
    let pair = [Math.min(num, target), Math.max(num, target)];
    if (seen.has(target)) {
      pairs[pair] = true;
    } else {
      seen.add(num);
    }
  })

  return Object.keys(pairs);
}

console.log(arrayPairSum([0, 1, 1, 2, 2, 3, 4], 4));

//O(NlogN) time
//O(1) space
function arrayPairSum(nums, k){
  nums.sort();
  let pairs = {};
  let i = 0;
  let j = nums.length - 1;
  while (i < j){
    let [left, right] = [nums[i], nums[k]]
    if (left + right === k) {
      pairs[[left, right]] = true;
    } else if (left + right < k) {
      i++;
    } else {
      j--;
    }
  }
  return Object.keys(pairs);
}
