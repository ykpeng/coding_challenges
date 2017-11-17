# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  left = left_boundary(nums, target)
  right = right_boundary(nums, target)
  [left, right]
end

def left_boundary(nums, target, low_idx = 0, high_idx = nums.length - 1)
  if low_idx > high_idx
    if target == nums[low_idx]
      return low_idx
    else
      return -1
    end
  end
  mid_idx = (low_idx + high_idx) / 2
  mid = nums[mid_idx]

  if target <= mid
    left_boundary(nums, target, low_idx, mid_idx - 1)
  else
    left_boundary(nums, target, mid_idx + 1, high_idx)
  end
end

def right_boundary(nums, target, low_idx = 0, high_idx = nums.length - 1)
  if low_idx > high_idx
    if target == nums[high_idx]
      return high_idx
    else
      return -1
    end
  end
  mid_idx = (low_idx + high_idx) / 2
  mid = nums[mid_idx]

  if target < mid
    right_boundary(nums, target, low_idx, mid_idx - 1)
  else
    right_boundary(nums, target, mid_idx + 1, high_idx)
  end
end

nums = [5, 7, 7, 8, 8, 10]
p search_range(nums, 8) == [3,4]
p search_range(nums, 6) == [-1, -1]
p search_range([1], 0) == [-1, -1]
p search_range([5, 7], 5) == [0, 0]
