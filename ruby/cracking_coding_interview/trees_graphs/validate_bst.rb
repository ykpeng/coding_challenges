# Implement a function to check if a binary tree is a binary search tree.

# time: n
# space: logn
def validate_bst(root, min=-1.0/0, max=1.0/0)
  return true if root.nil?

  val = root.val
  if val <= min || val > max
    return false
  end

  validate_bst(root.left_child, min, val) && validate_bst(root.right_child, val, max)
end

# time: n
# space: logn
last_seen = nil
def validate_bst2(root)
  if root.nil?
    return true
  end

  if !validate_bst2(root.left_child)
    return false
  end

  if last_seen && last_seen.val >= root.val
    return false
  end
  last_seen = root.val

  validate_bst2(root.right_child)
end

def validate_bst3(root, last_seen)
  if root.nil?
    return true, last_seen
  end

  left_bst, last_seen = validate_bst2(root.left_child, last_seen)
  
  if !left_bst
    return false, last_seen
  end

  if last_seen && last_seen.val >= root.val
    return false, last_seen
  end
  last_seen = root.val

  right_bst, last_seen = validate_bst2(root.right_child, last_seen)
  return right_bst, last_seen
end
