require 'byebug'
# Given a collection of distinct numbers, return all possible permutations.
# For example,
# [1,2,3] have the following permutations:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]

# @param {Integer[]} nums
# @return {Integer[][]}

# recursive
# def permute(nums)
#   if nums.empty?
#     return [[]]
#   end
#
#   prev_perms = permute(nums[0...-1])
#   new_perms = []
#   curr = nums.last
#   prev_perms.each do |perm|
#     (0..perm.length).each do |i|
#       new_perm = perm[0...i] + [curr] + perm[i..-1]
#       new_perms << new_perm
#     end
#   end
#   new_perms
# end

# iterative
# def permute(nums)
#   perms = [[]]
#
#   nums.each do |num|
#     new_perms = []
#     perms.each do |perm|
#       (0..perm.length).each do |i|
#         new_perm = perm[0...i] + [num] + perm[i..-1]
#         new_perms << new_perm
#       end
#     end
#     perms = new_perms
#   end
#
#   perms
# end

# backtracking
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

p permute([1,2,3])
p permute([1])
