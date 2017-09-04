def dfs(root, target)
  return if root.nil?
  return true if root.val == target
  root.marked = true

  root.children.each do |child|
    if !child.marked
      return true if dfs(child, target)
    end
  end

  false
end

def dfs2(root, target)
  return false if root.nil?
  
  @stack = [root]
  root.marked = true

  while !@stack.empty?
    curr = @stack.pop
    return true if curr.val == target

    curr.children.each do |child|
      if !child.marked
        @stack << child
        child.marked = true
      end
    end
  end

  false
end
