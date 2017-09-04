class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  # O(n)
  def [](i)
    each_with_index do |link, idx|
      return link if idx == i
    end

    nil
  end

  # O(1)
  def first
    return nil if empty?

    @head.next
  end

  # O(1)
  def last
    return nil if empty?

    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  # O(n)
  def get(key)
    each do |link|
      if link.key == key
        return link.val
      end
    end

    nil
  end

  # O(n)
  def include?(key)
    each do |link|
      if link.key == key
        return true
      end
    end

    false
  end

  # O(n)
  def insert(key, val)
    each do |link|
      if link.key == key
        link.val = val
        return link
      end
    end

    new_link = Link.new(key, val)

    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link

    new_link
  end

  # O(n)
  def remove(key)
    each do |link|
      if link.key == key
        link.prev.next = link.next
        link.next.prev = link.prev
        link.prev = nil
        link.next = nil
        return link
      end
    end

    nil
  end

  def each
    curr = @head.next
    while curr != @tail
      yield curr
      curr = curr.next
    end
  end
end
