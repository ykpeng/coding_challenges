function largestContSubSum(nums) {
  let largest = 0;
  let currSum = 0;
  for (let i = 0; i < nums.length; i++) {
    if (currSum + nums[i] > 0) {
      currSum += nums[i];
      if (currSum > largest) {
        largest = currSum;
      }
    } else {
      currSum = 0;
    }
  }

  return largest;
}

let sum = largestContSubSum([2,3,-3,5])
console.log(sum);
