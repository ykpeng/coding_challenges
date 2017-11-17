# Find the contiguous subarray within an array (containing at least one number) which has the largest sum.
# 
# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_sum = nums.first
  curr_sum = nums.first
  
  nums[1..-1].each do |num|
    curr_sum = [curr_sum + num, num].max
    max_sum = [curr_sum, max_sum].max
  end
  
  max_sum
end