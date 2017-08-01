# How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop and min should all operate in O(n) time.

class Stack
  def initialize
    @stack = []
    @mins = []
  end

  def push(el)
    @stack << el
    if min.nil? || el <= min
      @mins << el
    end
    el
  end

  def pop
    val = @stack.pop
    if val == min
      @mins.pop
    end
  end

  def min
    @mins.last
  end
end
