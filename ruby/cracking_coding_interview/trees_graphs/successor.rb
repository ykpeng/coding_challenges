# Write an algorithm to find the "next" node (i.e., in-order successor) of a given node in an binary search tree. You may assume that each node has a link to its parent.

def successor(node)
  return nil if node.nil?

  if node.right.nil?
    succ = node.parent
    while succ
      if succ.val > node.val
        return succ
      end
      succ = succ.parent
    end
    return nil
  else
    succ = node.right
    while succ.left
      succ = succ.left
    end
    return succ
  end
end

# time: logn
# space: 1
def successor2(node)
  return nil if node.nil?

  if node.right
    succ = node.right
    while succ.left
      succ = succ.left
    end
    return succ
  else
    succ = node.parent
    while succ && succ.left != node
      succ = succ.parent
      node = succ
    end
    return succ
  end
end
