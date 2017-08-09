def quick_sort(arr)
  if arr.length < 2
    return arr
  end

  pivot = arr.last

  left = arr[0...-1].select { |num| num <= pivot }
  right = arr[0...-1].select { |num| num > pivot }

  quick_sort(left) + [pivot] + quick_sort(right)
end

def quick_sort2(arr, left_idx = 0, right_idx = arr.length - 1)
  idx = partition2(arr, left_idx, right_idx)
  if left_idx < idx - 1
    quick_sort2(arr, left_idx, idx - 1)
  end

  if right_idx > idx
    quick_sort2(arr, idx, right_idx)
  end
end

def partition2(arr, left_idx, right_idx)
  mid_idx = (left_idx + right_idx) / 2
  pivot = arr[mid_idx]

  while left_idx <= right_idx
    while arr[left_idx] < pivot
      left_idx += 1
    end

    while arr[right_idx] > pivot
      right_idx -= 1
    end

    if left_idx <= right_idx
      arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
      left_idx += 1
      right_idx -= 1
    end
  end

  left_idx
end

# time: avg nlogn, worst n^2
# space: avg logn, worst n
def quick_sort3(arr, l = 0, r = arr.length - 1)
  if l >= r
    return arr
  end

  pivot = partition3(arr, l, r)
  quick_sort3(arr, l, pivot - 1)
  quick_sort3(arr, pivot + 1, r)
end

def partition3(arr, l, r)
  pivot = arr[r]
  i = l
  (l...r).each do |j|
    if arr[j] <= pivot
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
    end
  end

  arr[i], arr[r] = arr[r], arr[i]
  i
end

arr = [8,3,2,1,0,9]
p quick_sort3(arr)

def quick_sort4(arr, l = 0, r = arr.length - 1)
  if l >= r
    return arr
  end

  rand_idx = (rand(r - l) + l).to_i
  arr[rand_idx], arr[r] = arr[r], arr[rand_idx]
  pivot = partition3(arr, l, r)
  quick_sort4(arr, l, pivot - 1)
  quick_sort4(arr, pivot + 1, r)
end

def partition4(arr, l, r)
  pivot = arr[r]
  i = l
  (l...r).each do |j|
    if arr[j] <= pivot
      arr[i], arr[j] = arr[j], arr[i]
      i += 1
    end
  end

  arr[i], arr[r] = arr[r], arr[i]
  i
end
