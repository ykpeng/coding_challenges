# describe how you could use a single array to implement 3 stacks
class Stack
  def initialize
    @stack = []
    @length = @stack.length
  end

  def pop(stack_num)
    idx = @length % stack_num
    @stack[idx] = nil
  end

  def push(item, stack_num)
    @stack << item
  end

  def peek(stack_num)
    idx = @length % stack_num
    @stack[idx]
  end

  def is_empty(stack_num)

  end
end
