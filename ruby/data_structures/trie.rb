class Trie
  attr_reader :head

  def initialize
    @root = Node.new
  end

  def insert(word, node = @root, i = 0)
    if i == word.length
      node.children << Node.new("*") if !node.children.any? { |node| node.val == "*" }
      return
    end

    node.children.each do |child|
      if child.val == word[i]
        return insert(word, child, i + 1)
      end
    end

    new_node = Node.new(word[i])
    node.children << new_node
    insert(word, new_node, i + 1)
  end

  def search(word, node = @root, i = 0)
    if i == word.length
      return node.children.any? { |node| node.val == "*" }
    end

    node.children.each do |child|
      if child.val == word[i]
        return search(word, child, i + 1)
      end
    end

    false
  end

  def starts_with(prefix, node = @root, i = 0)
    if i == prefix.length
      return true
    end

    node.children.each do |child|
      if child.val == prefix[i]
        return starts_with(prefix, child, i + 1)
      end
    end

    false
  end
end

class Node
  attr_accessor :val, :children

  def initialize(val = nil)
    @val = val
    @children = []
  end
end

trie = Trie.new
trie.insert("world")
trie.insert("word")
trie.insert("wok")
trie.insert("why")
trie.insert("what")
trie.insert("apple")
p trie.starts_with("wor")
p trie.search("what")
p trie.starts_with("what")
p trie.search("wham")
