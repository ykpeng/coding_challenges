# Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.

# time: logn
# space: n

def make_bst(arr)
  return if arr.empty?
  mid_idx = arr.length / 2
  mid = arr[mid_idx]
  new_node = Node.new(mid)
  new_node.left_child = make_bst(arr[0...mid_idx])
  new_node.right_child = make_bst(arr[mid_idx + 1...arr.length])
  return new_node
end

# time: logn
# space: 1
def make_bst2(arr, start_idx = 0, end_idx = arr.length - 1)
  return if end_idx < start_idx
  mid_idx = (start_idx + end_idx) / 2
  mid = arr[mid_idx]
  new_node = Node.new(mid)
  new_node.left_child = make_bst2(arr, start_idx, mid_idx - 1)
  new_node.right_child = make_bst2(arr, mid_idx + 1, end_idx)
  return new_node
end

class Node
  attr_accessor :left_child, :right_child, :val

  def initialize(val)
    @val = val
    @left_child = nil
    @right_child = nil
  end
end

root = make_bst2([1,2,3,4,5,6,7])
p root
