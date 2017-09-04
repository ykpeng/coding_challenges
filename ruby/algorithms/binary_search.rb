def binary_search_recur(arr, target, low = 0, high = arr.length - 1)
  if low > high
    return nil
  end

  mid = (low + high) / 2
  mid_val = arr[mid]
  if target == mid_val
    mid
  elsif target > mid_val
    binary_search_recur(arr, target, mid + 1, high)
  else
    binary_search_recur(arr, target, low, mid - 1)
  end
end

def binary_search_iter(arr, target)
  return nil if arr.empty?

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

arr = [1,3,5,7,9,11]
p binary_search_iter(arr, 1)
p binary_search_iter(arr, 9)
p binary_search_iter(arr, 11)
p binary_search_iter(arr, 12)
p binary_search_iter(arr, 2)
