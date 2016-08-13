function sumRec(nums) {
  if (nums.length === 0) {
    return 0;
  }
  return nums[0] + sumRec(nums.slice(1));
}

console.log(sumRec([1,2,3,4,5]));
