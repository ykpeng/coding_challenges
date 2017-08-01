# Write code to remvoe dupicates from an unsorted linked list.
# Follow up: How would you solve this problem if a temporary buffer is not allowed?

# time: n
# space: n
require 'set'
def remove_dups1(head)
  node = head
  return node if node.val.nil?

  seen = Set.new(node.val)

  while !node.next.val.nil?
    if seen.include?(node.next.val)
      node.next = node.next.next
    else
      seen << node.next.val
    end
    node = node.next
  end

  head
end

# time: n^2
# space: 1
def remove_dups2(head)
  node1 = head

  while !node1.val.nil?
    prev = node1
    node2 = node1.next
    while !node2.val.nil?
      if node1.val == node2.val
        prev.next = node2.next
      else
        prev = node2
      end
      node2 = node2.next
    end
    node1 = node1.next
  end

  head
end
