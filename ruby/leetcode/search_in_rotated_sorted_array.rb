# Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
#
# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# You are given a target value to search. If found in the array return its index, otherwise return -1.
#
# You may assume no duplicate exists in the array.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# def search(nums, target, low_idx = 0, high_idx = nums.length - 1)
#   return -1 if low_idx > high_idx
#
#   mid_idx = (low_idx + high_idx) / 2
#   mid = nums[mid_idx]
#   low = nums[low_idx]
#   high = nums[high_idx]
#
#   if target == mid
#     return mid_idx
#   elsif target < mid
#     # if left half sorted
#     if low <= mid
#       if target >= low
#         # search left half
#         search(nums, target, low_idx, mid_idx - 1)
#       else
#         # search right half
#         search(nums, target, mid_idx + 1, high_idx)
#       end
#     else
#       # search left half
#       search(nums, target, low_idx, mid_idx - 1)
#     end
#   else
#     # if right half sorted
#     if high >= mid
#       if target <= high
#         # search right half
#         search(nums, target, mid_idx + 1, high_idx)
#       else
#         # search left half
#         search(nums, target, low_idx, mid_idx - 1)
#       end
#     else
#       # search right half
#       search(nums, target, mid_idx + 1, high_idx)
#     end
#   end
# end

def search(nums, target, low_idx = 0, high_idx = nums.length - 1)
  return -1 if low_idx > high_idx

  mid_idx = (low_idx + high_idx) / 2
  mid = nums[mid_idx]
  low = nums[low_idx]
  high = nums[high_idx]

  if target == mid
    return mid_idx
  end

  if low <= mid
    if target >= low && target < mid
      search(nums, target, low_idx, mid_idx - 1)
    else
      search(nums, target, mid_idx + 1, high_idx)
    end
  else
    if target > mid && target <= high
      search(nums, target, mid_idx + 1, high_idx)
    else
      search(nums, target, low_idx, mid_idx - 1)
    end
  end
end

arr1 = [4,5,6,7,0,1,2]
arr2 = [3, 1]
p search(arr1, 2) == 6
p search(arr1, 5) == 1
p search(arr1, 8) == -1
p search(arr2, 1) == 1
