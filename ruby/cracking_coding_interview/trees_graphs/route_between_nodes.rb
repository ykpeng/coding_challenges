# Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

class Node
  attr_accessor :val, :children, :visited

  def initialize(val)
    @val = val
    @children = []
    @visited = false
  end
end

class Graph
  def initialize(nodes)
    @nodes = nodes
  end
end

def bfs(node1, node2)
  @queue = []
  @queue.unshift(node1)
  while !@queue.empty?
    node = @queue.shift
    if node.val == node2.val
      return true
    end
    node.visited = true
    node.children.each do |child|
      @queue.unshift(child)
    end
  end
  false
end

def dfs(node1, node2)
  if node1.val == node2.val
    return true
  end
  node1.visited = true
  node1.children.each do |child|
    result = dfs(child, node2)
    return result if result
  end
  false
end

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
one.children = [two, three]
two.children = [four, five]
# five.children = [six]

bool = bfs(one, six)
p bool
