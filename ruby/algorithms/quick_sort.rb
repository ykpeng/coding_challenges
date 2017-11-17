def quick_sort(arr)
  if arr.length < 2
    return arr
  end

  pivot_val = arr[0]

  left = arr.select { |el| el < pivot_val }
  right = arr.select { |el| el > pivot_val }
  sorted_left = quick_sort(left)
  sorted_right = quick_sort(right)

  sorted_left.concat([pivot_val]).concat(sorted_right)
end

def quick_sort_in_place(arr, low = 0, high = arr.length - 1)
  if low >= high
    return
  end

  pivot_idx = partition(arr, low, high)

  quick_sort_in_place(arr, low, pivot_idx - 1)
  quick_sort_in_place(arr, pivot_idx + 1, high)
end

def partition(arr, low, high)
  pivot = arr[high]

  i = low
  j = high - 1

  while j >= i
    if arr[j] <= pivot
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
    else
      j -= 1
    end
  end
  arr[i], arr[high] = arr[high], arr[i]
  i
end

arr = [7,4,6,2,9,12,7,0]

p quick_sort_in_place(arr)
p arr
