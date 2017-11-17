require 'byebug'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  while lists.length > 1
    merged_lists = []
    (0...lists.length - 1).each do |i|
      next if i.odd?
      merged_lists << merge(lists[i], lists[i + 1])
    end
    lists = merged_lists
  end
  lists.first
end

def merge(list1, list2)
  new_head = nil
  prev_node = nil

  while !list1.nil? && !list2.nil?
    if list1.val < list2.val
      new_node = ListNode.new(list1.val)
      list1 = list1.next
    else
      new_node = ListNode.new(list2.val)
      list2 = list2.next
    end

    if prev_node
      prev_node.next = new_node
    else
      new_head = new_node
    end
    prev_node = new_node
  end

  while !list1.nil?
    new_node = ListNode.new(list1.val)
    prev_node.next = new_node
    list1 = list1.next
    prev_node = new_node
  end

  while !list2.nil?
    new_node = ListNode.new(list2.val)
    prev_node.next = new_node
    list2 = list2.next
    prev_node = new_node
  end

  new_head
end

list1 = ListNode.new(1)
list1.next = ListNode.new(5)

list2 = ListNode.new(2)
list2.next = ListNode.new(6)

list3 = ListNode.new(3)
list3.next = ListNode.new(7)

list4 = ListNode.new(4)
list4.next = ListNode.new(8)

lists = [list1, list2, list3, list4]
p merge_k_lists(lists)
