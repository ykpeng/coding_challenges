function pairSum (nums, k) {
  const pairs = {};
  const seen = {};

  for (let i = 0; i < nums.length; i++) {
    let target = k - nums[i];
    if (seen[target]) {
      let min = Math.min(nums[i], target);
      let max = Math.max(nums[i], target);
      pairs[[min, max]] = true;
    }
    seen[nums[i]] = true;
  }

  return Object.keys(pairs);
}

console.log(pairSum([1, 2, -1], 0));
console.log(pairSum([1, 2, -1, -1], 0));
console.log(pairSum([1, 2, -1, -1, -2], 0));
console.log(pairSum([1, 2, -1, -1, -2], 1));
console.log(pairSum([1, 2, -1, -1, -2], -1));
