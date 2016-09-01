function highestProductOfThree(nums){
  if (nums.length < 3) {
    throw new Error("less than 3 nums");
  }

  let highest3 = nums[0] * nums[1] * nums[2];
  let highest2 = nums[0] * nums[1];
  let highest1 = nums[0];
  let lowest2 = nums[0] * nums[1];
  let lowest1 = nums[0];

  for (let i = 0; i < nums.length; i++) {
    let curr = nums[i];

    highest3 = Math.max(highest3, highest2 * curr, lowest2 * curr);
    highest2 = Math.max(highest2, highest1 * curr, lowest1 * curr);
    highest1 = Math.max(highest1, curr);

    lowest2 = Math.min(lowest2, lowest * curr);
    lowest1 = Math.min(lowest1, curr);
  }
  return highest3;
}
