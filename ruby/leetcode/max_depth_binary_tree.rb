def max_depth(root)
  if root.nil?
    return 0
  end
  
  [max_depth(root.left), max_depth(root.right)].max + 1
end