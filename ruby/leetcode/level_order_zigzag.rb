# Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
# 
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its zigzag level order traversal as:
# [
#   [3],
#   [20,9],
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

def zigzag_level_order(root, res = [], level = 0)
  return res if root.nil?
  
  if res.length <= level
    res << []
  end
  
  curr_level_arr = res[level]
  if level.even?
    curr_level_arr << root.val
  else
    curr_level_arr.unshift(root.val)
  end
  
  zigzag_level_order(root.left, res, level + 1)
  zigzag_level_order(root.right, res, level + 1)
  
  res
end