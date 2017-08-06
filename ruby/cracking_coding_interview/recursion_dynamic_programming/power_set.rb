# Write a method to return all subsets of a set.

# time: n2^(n)
# space: n2^(n) ?
def subsets(arr)
  if arr.empty?
    return [[]]
  end

  prev_subsets = subsets(arr[0...-1])
  new_subsets = prev_subsets.map do |subset|
    subset << arr.last
  end
  prev_subsets.concat(new_subsets)
end

def subsets(arr, idx = arr.length)
  if arr.length == idx
    return [[]]
  end

  prev_subsets = subsets(arr, idx - 1)
  last_item = arr[idx - 1]
  new_subsets = prev_subsets.map do |subset|
    subset << last_item
  end
  prev_subsets.concat(new_subsets)
end
