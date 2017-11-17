def binary_search_right_boundary(arr, target, low_idx = 0, high_idx = arr.length - 1)
  return low_idx if low_idx > high_idx

  mid_idx = (low_idx + high_idx) / 2
  mid = arr[mid_idx]

  if target < mid
    binary_search_right_boundary(arr, target, low_idx, mid_idx - 1)
  else
    binary_search_right_boundary(arr, target, mid_idx + 1, high_idx)
  end
end

def binary_search_left_boundary(arr, target, low_idx = 0, high_idx = arr.length - 1)
  return high_idx if low_idx > high_idx

  mid_idx = (low_idx + high_idx) / 2
  mid = arr[mid_idx]

  if target <= mid
    binary_search_left_boundary(arr, target, low_idx, mid_idx - 1)
  else
    binary_search_left_boundary(arr, target, mid_idx + 1, high_idx)
  end
end

arr = [1,2,3,4,4,4,4,4,5,6,7]
p binary_search_right_boundary(arr, 4) == 8
p binary_search_left_boundary(arr, 4) == 2
