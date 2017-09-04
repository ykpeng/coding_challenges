require_relative '../data_structures/tree'
require_relative '../data_structures/graph'

def bfs(root, target)
  @queue = [root]

  while !@queue.empty?
    curr = @queue.shift
    if curr.val == target
      return true
    end

    @queue << curr.left if curr.left
    @queue << curr.right if curr.right
  end

  false
end

def graph_search(graph, target)
  graph.nodes.each do |root|
    return true if bfs2(root, target)
  end

  false
end

def bfs2(root, target)
  @queue = [root]
  root.marked = true

  while !@queue.empty?
    curr = @queue.shift
    if curr.val == target
      return true
    end
    curr.children.each do |child|
      @queue << child if !child.marked
      child.marked = true
    end
  end

  false
end

def bi_bfs(root1, root2)
  @queue1 = [root1]
  @queue2 = [root2]

  while !@queue1.empty? && !@queue2.empty?
    if !@queue1.empty?
      curr1 = @queue1.shift

      if @queue2.include?(curr1)
        return true
      end

      curr1.children.each do |child|
        if !child.marked
          @queue1 << child
          child.marked = true
        end
      end
    end

    if !@queue2.empty?
      curr2 = @queue2.shift

      if @queue1.include?(curr2)
        return true
      end

      curr2.children.each do |child|
        if !child.marked
          @queue2 << child
          child.marked = true
        end
      end
    end
  end

  false
end
