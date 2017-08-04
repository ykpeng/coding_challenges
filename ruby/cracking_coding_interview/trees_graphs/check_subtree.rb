# T1 and T2 are two very large binary trees with T1 much bigger than T2. Create an algoirthm to determine if T2 is a subtree of T1.
# A tree T2 is a subtree of T1 if there exists a node n in T1 such that the subtree of n is identical to T2. That is, if you cut off the tree at the node n, the two trees would be identical.

def check_subtree(root1, root2)
  t1_str = stringify(root1)
  t2_str = stringify(root2)

  t1_str.include?(t2_str)
end

def stringify(root, str = "")
  if root.nil?
    str << "x"
    return str
  end

  str << root.val.to_s
  stringify(root.left, str)
  stringify(root.right, str)
end

class Node
  attr_accessor :left, :right, :val

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
seven = Node.new(7)

one.left = two
one.right = three
two.left = four
two.right = five
three.left = six
three.right = seven

puts stringify(one)

def check_subtree2(root1, root2)
  if root2.nil?
    return true
  end

  can_find_matching_node(root1, root2)
end

def can_find_matching_node(root1, root2)
  if root1.nil?
    return false
  end

  if root1.val == root2.val && rest_of_tree_matches(root1, root2)
    return true
  end

  can_find_matching_node(root1.left, root2) || can_find_matching_node(root1.right, root2)
end

def rest_of_tree_matches(root1, root2)
  if root1.nil? && root2.nil?
    return true
  end

  if root1&.val != root2&.val
    return false
  end

  rest_of_tree_matches(root1.left, root2.left) && rest_of_tree_matches(root1.right, root2.right)
end
