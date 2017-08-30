def reverse(head)
  prev = nil
  curr = head

  while !curr.nil?
    next_node = curr.next
    curr.next = prev
    prev = curr
    curr = next_node
  end

  prev
end

class Node
  attr_accessor :val, :next

  def initialize(val, next_node = nil)
    @val = val
    @next = next_node
  end
end

e = Node.new("e")
d = Node.new("d", e)
c = Node.new("c", d)
b = Node.new("b", c)
a = Node.new("a", b)

# curr = a
head = reverse(a)
p head
