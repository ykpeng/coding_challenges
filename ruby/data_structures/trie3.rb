class Trie
  attr_reader :head

  def initialize
    @root = Node.new
  end

  def insert(word)
    node = @root
    word.chars do |letter|
      i = letter.ord - 97
      if !node.children[i]
        node.children[i] = Node.new
      end
      node = node.children[i]
    end
    node.is_word = true
  end

  def search(word)
    node = @root
    word.chars do |letter|
      i = letter.ord - 97
      return false if !node.children[i]
      node = node.children[i]
    end
    node.is_word
  end

  def starts_with(prefix)
    node = @root
    prefix.chars do |letter|
      i = letter.ord - 97
      return false if !node.children[i]
      node = node.children[i]
    end
    true
  end
end

class Node
  attr_accessor :children, :is_word

  def initialize
    @children = []
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
p trie.search("wha")
p trie.starts_with("what")
p trie.search("wham")
