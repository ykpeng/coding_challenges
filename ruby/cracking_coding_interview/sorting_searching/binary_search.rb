# time: logn
# space: 1
def binary_search_inter(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    mid_val = arr[mid]
    if target == mid_val
      return mid
    elsif target > mid_val
      low = mid + 1
    else
      high = mid - 1
    end
  end

  nil
end

# time: logn
# space: logn
def binary_search_recur(arr, low = 0, high = arr.length - 1, target)
  if low > high
    return nil
  end

  mid = (low + high) / 2
  mid_val = arr[mid]
  if target == mid_val
    return mid
  elsif target > mid_val
    binary_search_recur(arr, mid + 1, high, target)
  else
    binary_search_recur(arr, low, mid - 1, target)
  end
end

arr = [2,3,5,7,8,24,56,99]
p binary_search_recur(arr, 24)
