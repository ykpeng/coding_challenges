class BinaryMinHeap
  def initialize(&prc)
    @store = []
  end

  def count
    @store.count
  end

  # O(logn)
  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    self.class.heapify_down(@store, 0)
    extracted
  end

  # O(1)
  def peek
    @store.first
  end

  # O(logn)
  def push(val)
    @store << val
    self.class.heapify_up(@store, @store.length - 1)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    indices = []

    left = parent_index * 2 + 1
    if left < len
      indices << left
    end

    right = left + 1
    if right < len
      indices << right
    end

    indices
  end

  def self.parent_index(child_index)
    if child_index == 0
      raise "root has no parent"
    end

    (child_index - 1) / 2
  end

  # O(logn)
  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    if prc.nil?
      prc = Proc.new { |el1, el2| el1 <=> el2 }
    end

    left, right = child_indices(len, parent_idx)

    return array if left.nil?

    if right && prc.call(array[left], array[right]) > 0
      if right && prc.call(array[parent_idx], array[right]) > 0
        array[parent_idx], array[right] = array[right], array[parent_idx]
        heapify_down(array, right, len, &prc)
      end
    else
      if prc.call(array[parent_idx], array[left]) > 0
        array[parent_idx], array[left] = array[left], array[parent_idx]
        heapify_down(array, left, len, &prc)
      end
    end

    array
  end

  # O(logn)
  def self.heapify_up(array, child_idx, len = array.length, &prc)
    if prc.nil?
      prc = Proc.new { |el1, el2| el1 <=> el2 }
    end

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    if prc.call(array[parent_idx], array[child_idx]) > 0
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      heapify_up(array, parent_idx, len, &prc)
    end

    array
  end
end
