require 'byebug'
# Given a collection of numbers that might contain duplicates, return all possible unique permutations.
#
# For example,
# [1,1,2] have the following unique permutations:
# [
#   [1,1,2],
#   [1,2,1],
#   [2,1,1]
# ]

# @param {Integer[]} nums
# @return {Integer[][]}
# def permute_unique(nums, perms = [], l = 0, r = nums.length - 1)
#   if l == r
#     perms << nums.dup
#     return perms
#   end
#
#   (l..r).each do |i|
#     next if l != i && nums[l] == nums[i]
#     nums[l], nums[i] = nums[i], nums[l]
#     permute_unique(nums, perms, l + 1, r)
#     nums[l], nums[i] = nums[i], nums[l]
#   end
#
#   perms
# end

def permute(arr, start = 0, results = [])
  if start == arr.length
    results << arr.dup
  end

  (start...arr.length).each do |i|
    arr[start], arr[i] = arr[i], arr[start]
    permute(arr, start + 1, results)
    arr[start], arr[i] = arr[i], arr[start]
  end

  results
end

nums = [1,1,2]
p permute_unique(nums)
