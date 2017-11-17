# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
# 
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?

  curr_level = [root]
  next_level = []
  res = []

  while !curr_level.empty?
    curr_level.each do |curr|
      if curr.left && curr.left.val
        next_level << curr.left
      end

      if curr.right && curr.right.val
        next_level << curr.right
      end
    end
    
    res << curr_level.map(&:val)
    curr_level = next_level
    next_level = []
  end

  res
end

def level_order2(root, res = [], level = 0)
  return res if root.nil? || root.val.nil?
  
  if res.length <= level
    res << []
  end
  
  res[level] << root.val
  
  level_order2(root.left, res, level + 1)
  level_order2(root.right, res, level + 1)
  
  res
end

d = TreeNode.new(nil)
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

p level_order2(d)