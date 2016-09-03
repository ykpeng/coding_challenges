function findDupSpace(nums, n){
  let i = 0;
  while (i < n + 1) {
    if (nums[i] < 1 || nums[i] > n) {
      i++;
    } else if (nums[nums[0]] <= n) {
      nums[0] = nums[nums[0]];
      nums[nums[0]] = n + 1;
    } else {
      nums[nums[0]]++;
      i++;
      nums[0] = nums[i];
      nums[i] = 0;
    }
  }
}

function findDupSpace(nums) {
  nums.sort();
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === nums[i + 1]) {
      return nums[i];
    }
  }
  return null;
}
