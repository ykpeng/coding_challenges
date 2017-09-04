class Trie
  attr_reader :head

  def initialize
    @root = Node.new
  end

  def insert(word)
    node = @root
    word.chars do |letter|
      if !node.children[letter]
        node.children[letter] = Node.new
      end
      node = node.children[letter]
    end
    node.is_word = true
  end

  def search(word)
    node = @root
    word.chars do |letter|
      return false if !node.children[letter]
      node = node.children[letter]
    end
    node.is_word
  end

  def starts_with(prefix)
    node = @root
    prefix.chars do |letter|
      return false if !node.children[letter]
      node = node.children[letter]
    end
    true
  end
end

class Node
  attr_accessor :children, :is_word

  def initialize
    @children = Hash.new
    @is_word = false
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
p trie.starts_with("wheat")
p trie.search("wham")
