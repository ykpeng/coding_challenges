//without start and end indices
function largestContinuousSum(nums) {
  let maxSum = nums[0];
  let currSum = nums[0];
  for (let i = 1; i < nums.length; i++) {
    let potentialSum = currSum + nums[i];
    currSum = Math.max(potentialSum, nums[i]);
    maxSum = Math.max(currSum, maxSum);
  }
  return maxSum;
}

//with start and end indices
function largestContinuousSum2(nums){
  let maxSum = currSum = nums[0];
  let start = currStart = 0;
  let end = currEnd = 0;
  for (let i = 1; i < nums.length; i++) {
    let potentialSum = currSum + nums[i];
    if (potentialSum < nums[i]) {
      currSum = nums[i];
      currStart = i;
      currEnd = i;
    } else {
      currSum += nums[i];
      currEnd = i;
      if (currSum > maxSum) {
        maxSum = currSum;
        start = currStart;
        end = currEnd;
      }
    }
  }
  return [maxSum, start, end];
}

console.log(largestContinuousSum2([-40,1,40,-50,1,50,-20,1,20,0,0]));
