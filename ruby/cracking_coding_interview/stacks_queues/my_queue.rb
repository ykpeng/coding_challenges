class MyQueue
  def initialize
    @stack = Stack.new
    @reversed = Stack.new
  end

  def enqueue(el)
    @stack << el
  end

  def dequeue
    shift_stacks
    @reversed.pop
  end

  def peek
    shift_stacks
    @reversed.peek
  end

  private

  def shift_stacks
    if @reversed.empty?
      while !@stack.empty?
        @reversed.push(@stack.pop)
      end
    end
  end
end

class Stack
  def initialize
    @stack = []
    @length = 0
  end

  def push(el)
    @stack << el
    @length += 1
  end

  def pop
    @stack.pop
    @length -= 1
  end

  def peek
    @stack.last
  end

  def empty?
    @length == 0
  end
end
