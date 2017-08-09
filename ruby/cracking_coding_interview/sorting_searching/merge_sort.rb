def merge_sort(arr)
  if arr.length < 2
    return arr
  end

  mid_idx = arr.length / 2

  left = merge_sort(arr[0..mid_idx])
  right = merge_sort(arr[mid_idx + 1..-1])

  merge(left, right)
end

def merge(left, right)
  merged = []
  while !left.empty? && !right.empty?
    if left.first <= right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end

  merged.concat(left).concat(right)
end

# time: nlogn ?
# space: n

def merge_sort2(arr, helper = [], low_idx = 0, high_idx = arr.length - 1)
  if low_idx < high_idx
    mid_idx = (low_idx + high_idx) / 2

    merge_sort(arr, low_idx, mid_idx)
    merge_sort(arr, mix_idx + 1, high_idx)

    merge(arr, helper, low_idx, mid_idx, high_idx)
  end
end

def merge2(arr, helper, low_idx, mid_idx, high_idx)
  low_idx.upto(high_idx) do |i|
    helper[i] = arr[i]
  end

  helper_left_idx = low_idx
  helper_right_idx = mid_idx + 1
  curr_idx = low_idx

  while helper_left_idx <= mid_idx && helper_right_idx <= high_idx
    if helper[helper_left_idx] <= helper[helper_right_idx]
      arr[curr_idx] = helper[helper_left_idx]
      helper_left_idx += 1
    else
      arr[curr_idx] = helper[helper_right_idx]
      helper_right_idx += 1
    end
    curr_idx += 1
  end

  remaining = mid_idx - helper_left_idx
  0.upto(remaining) do |i|
    arr[curr_idx + i] = helper[helper_left_idx + i]
  end
end
