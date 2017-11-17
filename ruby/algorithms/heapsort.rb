require 'byebug'

def heapify_down(arr, parent_idx = 0, n = arr.length)
  left_child_idx, right_child_idx = child_indices(parent_idx, n)
  largest = parent_idx

  if left_child_idx && arr[left_child_idx] > arr[parent_idx]
    largest = left_child_idx
  end

  if right_child_idx && arr[right_child_idx] > arr[largest]
    largest = right_child_idx
  end

  if largest != parent_idx
    arr[largest], arr[parent_idx] = arr[parent_idx], arr[largest]
    heapify_down(arr, largest, n)
  end
end

def child_indices(parent_idx, n)
  indices = []
  left_child_idx, right_child_idx = parent_idx * 2 + 1, parent_idx * 2 + 2

  if left_child_idx < n
    indices << left_child_idx
  end

  if right_child_idx < n
    indices << right_child_idx
  end

  indices
end

def heapsort(arr)
  n = arr.length
  build_heap(arr)

  (arr.length - 1).downto(1).each do |i|
    arr[0], arr[i] = arr[i], arr[0]
    heapify_down(arr, 0, i)
  end
end

def build_heap(arr)
  (arr.length - 1).downto(0).each do |i|
    heapify_down(arr, i)
  end
end

arr = [5, 12, 11, 13, 6, 7]
build_heap(arr)
# heapsort(arr)
p arr
