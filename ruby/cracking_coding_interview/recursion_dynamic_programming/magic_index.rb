# A magic index in an array A[0...n-1] is defined to be an index such that A[i]= i. Given a sorted array of distinct integers, write a method to find a magic index, if one exists, in array A.

# time: logn
# space: 1
def find_magic_index(arr, start_idx = 0, end_idx = arr.length - 1)
  if start_idx > end_idx
    return nil
  end

  mid_idx = (start_idx + end_idx) / 2

  if arr[mid_idx] == mid_idx
    mid_idx
  elsif arr[mid_idx] < mid_idx
    find_magic_index(arr, mid_idx + 1, end_idx)
  else
    find_magic_index(arr, start_idx, mid_idx - 1)
  end
end

# FOLLOW UP: What if the values are not distinct?
def find_magic_index2(arr, start_idx = 0, end_idx = arr.length - 1)
  if start_idx > end_idx
    return nil
  end

  mid_idx = (start_idx + end_idx) / 2

  diff = arr[mid_idx] - mid_idx

  if diff == 0
    mid_idx
  elsif diff > 0
    find_magic_index2(arr, mid_idx + diff, end_idx) || find_magic_index2(arr, start_idx, mid_idx - 1)
  else
    find_magic_index2(arr, start_idx, mid_idx + diff) || find_magic_index2(arr, mid_idx + 1, end_idx)
  end
end

def find_magic_index3(arr, start_idx = 0, end_idx = arr.length - 1)
  if start_idx > end_idx
    return nil
  end

  mid_idx = (start_idx + end_idx) / 2
  mid_val = arr[mid_idx]
  if mid_val == mid_idx
    return mid_idx
  end

  left_idx = [mid_val, mid_idx - 1].min
  right_idx = [mid_val, mid_idx + 1].max
  find_magic_index3(arr, start_idx, left_idx) || find_magic_index3(arr, right_idx, end_idx)
end
