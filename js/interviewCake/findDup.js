function findDup(nums){
  let sum = nums * (nums + 1)) / 2;
  return nums.reduce((a, b) => a + b) - sum;
}
