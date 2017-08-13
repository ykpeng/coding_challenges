# Given a sorted array of n integers that has been rotated an unknown number of times, write code to find an element in the array. You may assume that the array was originally sorted in increasing order.

# time: logn or n (worst)
# space: logn or n (worst)
def search_in_rotated_array(arr, target, low = 0, high = arr.length - 1)
  if low > high
    return nil
  end

  low_val = arr[low]
  high_val = arr[high]
  mid = (low + high) / 2
  mid_val = arr[mid]

  if target == mid_val
    return mid
  end

  if low_val < mid_val
    if target >= low_val && target < mid_val
      search_in_rotated_array(arr, target, low, mid - 1)
    else
      search_in_rotated_array(arr, target, mid + 1, high)
    end
  elsif low_val > mid_val
    if target > mid_val && target <= high_val
      search_in_rotated_array(arr, target, mid + 1, high)
    else
      search_in_rotated_array(arr, target, low, mid - 1)
    end
  elsif low_val == mid_val
    if mid_val != high_val
      search_in_rotated_array(arr, target, mid + 1, high)
    else
      search_in_rotated_array(arr, target, low, mid - 1) || search_in_rotated_array(arr, target, mid + 1, high)
    end
  end
end

arr = [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]
p search_in_rotated_array(arr, 2)
