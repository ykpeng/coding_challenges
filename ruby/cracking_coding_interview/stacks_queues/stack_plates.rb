class SetOfStacks
  def initialize(cap)
    @stacks = Stack.new
    @cap = cap
  end

  def push(el)
    if peek.length == @cap
      new_stack = Stack.new.push(el)
      @stacks.push(new_stack)
    else
      peek.push(el)
    end
  end

  def pop
    peek.pop
    if peek.empty?
      @stacks.pop
    end
  end

  def pop_at(idx)

  end

  def peek
    @stacks.peek
  end

  def empty?
    @stacks.empty?
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
