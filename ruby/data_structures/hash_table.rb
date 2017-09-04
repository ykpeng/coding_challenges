require_relative 'linked_list'

class HashTable
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if !include?(key)
      resize! if @count >= capacity
      @count += 1
    end
    bucket(key).insert(key, val)
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    deleted = bucket(key).remove(key)
    if deleted
      @count -= 1
    end
    deleted
  end

  def each
    @store.each do |linked_list|
      linked_list.each do |link|
        yield [link.key, link.val]
      end
    end
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    # new_num_buckets = num_buckets * 2
    # new_store = Array.new(new_num_buckets) { LinkedList.new }
    # each do |key, val|
    #   new_store[key.hash % new_num_buckets].insert(key, val)
    # end
    #
    # @store = new_store
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    old_store.each do |linked_list|
      linked_list.each do |link|
        set(link.key, link.val)
      end
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
