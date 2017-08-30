# Imagine you are reading in a stream of integers. Periodically, you wish to be able to look up the rank of a number x (the number of values less than or equal to x). Implement the data structures and algorithms to support these operations. That is, implement the method track(x), which is called when each number is generated, and the method get_rank_of_number(x), which returns the number of values less than or equal to x (not including x itself).

tree = Tree.new
def track(val, tree)
  # insert into binary search tree
  if tree.root.nil?
    tree.root = Node.new(val)
  else
    tree.root.insert(val)
  end
end

def get_rank(val, tree)
  # count num children on left subtree + 1
  tree.root.get_ranke(val)
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end
end

class Node
  attr_accessor :val, :left, :right, :left_size

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
    @left_size = 0
  end

  def insert(val)
    if val <= @val
      if !@left.nil?
        @left.insert(val)
      else
        @left = Node.new(val)
        @left_size += 1
      end
    else
      if !@right.nil?
        @right.insert(val)
      else
        @right = Node.new(val)
      end
    end
  end

  def get_rank(val)
    if val == @val
      @left_size
    elsif val > @val
      return nil if @right.nil?
      rank = get_rank(@right)
      return ni l if rank.nil?
      @left_size + 1 + rank
    else
      return nil if @left.nil?
      get_rank(@left)
    end
  end
end
