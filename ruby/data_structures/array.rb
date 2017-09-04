class StaticArray
  def initialize(cap)
    @store = Array.new(cap)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  def length
    @store.length
  end

  private

  def validate!(i)
    raise "Overflow error" if !i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  attr_reader :count

  def initialize(cap = 8)
    @store = StaticArray.new(8)
    @count = 0
    @start_idx = 0
  end

  def [](i)
    if i >= @count
      return nil
    elsif i < 0
      if i <= - @count
        return nil
      else
        return self[@count + i]
      end
    else

    @store[(@start_idx + i) % capacity]
  end

  def []=(i, val)
    if i >= @count
      (i - @count).times do
        @store.push(nil)
      end
    elsif i < 0
      if i <= - @count
        return nil
      else
        self[@count + i] = val
      end
    end

    if i == @count
      resize! if @count == capacity
      @count += 1
    end

    @store[(@start_idx + i) % capacity] = val
  end

  def capacity
    @store.length
  end

  def include?(val)
    # iterate and find val
    self.each do |el|
      if el == val
        return true
      end
    end

    false
  end

  def push(val)
    resize! if @count == capacity
    @store[(@start_idx + @count) % capacity] = val
    @count += 1
    self
  end

  def unshift(val)
    resize! if @count == capacity
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @count += 1
    self
  end

  def pop
    return nil if @count == 0

    last_item = @store[(@start_idx + @count - 1) % capacity]
    @store[(@start_idx + @count - 1) % capacity] = nil
    @count -= 1
    last_item
  end

  def shift
    return nil if @count == 0

    first_item = @store[@start_idx]
    @store[@start_idx] = nil
    @count -= 1
    @start_idx = (@start_idx + 1) % capacity
    first_item
  end

  def first
    return nil if @count == 0

    @store[@start_idx]
  end

  def last
    return nil if @count == 0

    @store[(@start_idx + @count - 1) % capacity]
  end

  def each
    i = 0
    while i < @count
      yield self[i]
      i += 1
    end
    self
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false if @count != other.count

    i = 0
    while i < @count
      if self[i] != other[i]
        return false
      end
      i += 1
    end

    true
  end

  private

  def resize!
    new_store = StaticArray.new(capacity * 2)
    i = 0
    while i < @count
      new_store[i] = self[i]
      i += 1
    end
    @store = new_store
    @start_idx = 0
  end
end
