require 'byebug'
def merge_sort(arr)
  if arr.length < 2
    return arr
  end

  mid_idx = arr.length / 2

  left = merge_sort(arr[0...mid_idx])
  right = merge_sort(arr[mid_idx..-1])

  merge(left, right)
end

def merge(left, right)
  merged = []
  while !left.empty? && !right.empty?
    if left.first < right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged.concat(left).concat(right)
end

def merge_sort_in_place(arr, low = 0, high = arr.length - 1)
  if low >= high
    return
  end
  mid = (low + high) / 2
  merge_sort_in_place(arr, low, mid)
  merge_sort_in_place(arr, mid + 1, high)

  merge_in_place(arr, low, high, mid)
end

def merge_in_place(arr, low, high, mid)
  helper = Array.new
  (0...arr.length).each do |idx|
    helper[idx] = arr[idx]
  end

  i = low
  j = mid + 1
  curr = low

  while i <= mid && j <= high
    if helper[i] <= helper[j]
      arr[curr] = helper[i]
      i += 1
    else
      arr[curr] = helper[j]
      j += 1
    end
    curr += 1
  end

  while i <= mid
    arr[curr] = helper[i]
    i += 1
    curr += 1
  end

  while j <= high
    arr[curr] = helper[j]
    j += 1
    curr += 1
  end
end

arr = [7,4,6,2,9,12,7,0]

p merge_sort_in_place(arr)
p arr
