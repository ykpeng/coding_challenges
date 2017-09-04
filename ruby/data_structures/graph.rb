class Node
  attr_accessor :val, :children, :marked

  def initialize(val)
    @val = val
    @children = []
    @marked = false
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end
end
