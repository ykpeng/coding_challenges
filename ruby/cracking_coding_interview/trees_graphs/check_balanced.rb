# Implement a function to check if a binary tree is balanced. For the purposes of this question, a balanced tree is defined to be a tree such that the heights of the two subtrees of any node never differ by more than one.

# time: nlogn
def is_bst(root)
  return true if root.nil?

  left_height = get_height(root.left)
  right_height = get_height(root.right)

  if (left_height - right_height).abs > 1
    false
  else
    is_bst(root.left) && is_bst(root.right)
  end
end

def get_height(root)
  return -1 if root.nil?

  left_height = get_height(root.left)
  right_height = get_height(root.right)

  height = [left_height, right_height].max
  new_height = height + 1
end

def check_height(root)
  return -1 if root.nil?

  left_height = check_height(root.left)
  if !left_height
    return false
  end
  right_height = check_height(root.right)
  if !right_height
    return false
  end

  if (left_height - right_height).abs > 1
    false
  else
    height = [left_height, right_height].max
    new_height = height + 1
  end
end

def is_bst2(root)
  !!check_height(root)
end
