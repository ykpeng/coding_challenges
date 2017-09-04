class Stack
  def initialize
    @top = nil
  end

  def push(val)
    new_node = Node.new(val)
    new_node.next = @top
    @top = new_node
    @top.val
  end

  def pop
    return nil if empty?
    popped = @top
    @top = @top.next
    popped.val
  end

  def peek
    return nil if empty?
    @top.val
  end

  def empty?
    @top.nil?
  end
end

class Queue
  def initialize
    @head = nil
    @tail = nil
  end

  def enqueue(val)
    new_node = Node.new(val)

    if !empty?
      @tail.next = new_node
    end

    @tail = new_node

    if empty?
      @head = @tail
    end
    
    @tail.val
  end

  def dequeue
    return nil if empty?

    dequeued = @head
    @head = @head.next
    @tail = nil if empty?
    dequeued.valsa
  end

  def peek
    return nil if empty?
    @head.val
  end

  def empty?
    @head = nil
  end
end

class Node
  attr_accessor :val, :next_node

  def initialize(val)
    @val = val
    @next_node = next_node
  end
end
