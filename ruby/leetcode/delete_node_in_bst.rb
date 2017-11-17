# Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
#
# Basically, the deletion can be divided into two stages:
#
# Search for a node to remove.
# If the node is found, delete the node.
# Note: Time complexity should be O(height of tree).

def delete_node(root, val)
  parent, node = find_node(root, val)
  return root if node.nil?
  _delete_node(parent, node)
end

def _delete_node(parent, node)
  is_left_child = parent.left == node
  is_right_child = parent.right == node

  if node.left && node.right
    min_parent, min_node = find_min(node)
    node.val = min_node.val
    _delete_node(min_parent, min_node)
  elsif node.left
    if is_left_child
      parent.left = node.left
    else
      parent.right = node.left
    end
  elsif node.right
    if is_left_child
      parent.left = node.right
    else
      parent.right = node.right
    end
  else
    if is_left_child
      parent.left = nil
    else
      parent.right = nil
    end
  end
end

def find_node(parent = nil, node, val)
  return nil if node.nil?

  node_val = node.val
  if val == node_val
    parent, node
  elsif val > node_val
    find_node(node, node.right, val)
  else
    find_node(node, node.left, val)
  end
end

def find_min(node)
  if node.left

  end
end
