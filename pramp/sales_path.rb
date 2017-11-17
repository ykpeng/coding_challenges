# A good followup question is how to alter the function in order to return all the Sales Paths with minimal cost in an array. Another good question, is how to use the function above to determine the longest or shortest Sales Path path.

# O(n)
def min_cost(node)
  if node.children.empty?
    return node.val
  end

  min = 1.0/0
  node.children.each do |child|
    cost = min_cost(child, sum)
    if cost < min
      min = cost
    end
  end

  min + node.val
end
