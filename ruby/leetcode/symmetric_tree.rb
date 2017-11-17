# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
# 
# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
# 
#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3
# Note:
# Bonus points if you could solve it both recursively and iteratively.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
# def is_symmetric(root)
#   arr = to_arr(root)
# 
#   start = 0
#   level = 0
#   length = 2 ** level
# 
#   while start + length <= arr.length
#     return false if !is_palindrome?(arr[start, length])
#     level += 1
#     start += length
#     length = 2 ** level
#   end
# 
#   true
# end
# 
# def to_arr(root)
#   queue = [root]
#   res = []
# 
#   while !queue.empty?
#     curr = queue.shift
#     res << curr.val
#     if curr.left
#       queue << curr.left
#     end
# 
#     if curr.right
#       queue << curr.right
#     end
#   end
# 
#   res
# end
# 
# def children_indices(parent_idx)
#   parent_idx * 2 + 1
# end
# 
# def is_palindrome?(arr)
#   (0...arr.length / 2).each do |i|
#     return false if arr[i] != arr[arr.length - i - 1]
#   end
#   true
# end

def is_symmetric(root)
  return true if root.nil?
  mirror?(root.left, root.right)
end

def mirror?(node1, node2)
  if node1.nil? && node2.nil?
    return true
  end
  
  if node1.nil? || node2.nil?
    return false
  end
  
  node1.val == node2.val && mirror?(node1.left, node2.right) && mirror?(node1.right, node2.left)
end

def is_symmetric_iter(root)
  queue = [root.left, root.right]
  while !queue.empty?
    node1 = queue.shift
    node2 = queue.shift
    if node1.nil? && node2.nil?
      next
    end
    
    if node1.nil? || node2.nil?
      return false
    end
    
    if node1.val != node2.val
      return false
    end
    
    queue << node1.left
    queue << node2.right
    queue << node1.right
    queue << node2.left
  end
  true
end

d = TreeNode.new(3)
e = TreeNode.new(4)
f = TreeNode.new(4)
g = TreeNode.new(3)
b = TreeNode.new(2)
b.left = d
b.right = e
c = TreeNode.new(2)
c.left = f
c.right = g
a = TreeNode.new(1)
a.left = b
a.right = c

p is_symmetric_iter(a)
