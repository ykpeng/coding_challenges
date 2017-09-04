require_relative 'linked_list'
require_relative 'hash_table'

class LRUCache
  attr_reader :count

  def initialize(max, prc)
    @map = HashTable.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  # O(1) lookup
  def get(key)
    link = @map[key]

    if link
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  private

  def calc!(key)
    if count == @max
      eject!
    end

    val = @prc.call(key)
    link = @store.insert(key, val)
    @map.set(key, link)

    val
  end

  # O(1) update
  def update_link!(link)
    link.prev.next = link.next
    link.next.prev = link.prev

    link.prev = @store.last
    link.next = @store.last.next
  end

  # O(1) deletion
  def eject!
    link = @store.first
    link.prev.next = link.next
    link.next.prev = link.prev
    link.prev = nil
    link.next = nil
    @map.delete(link.key)
    link
  end
end
