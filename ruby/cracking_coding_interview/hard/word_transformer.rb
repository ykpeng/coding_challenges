# Given two words of equal length that are in the dictionary, write a method to transform one word to another word by changing only one letter at a time. The new word you get in each step must be in the dictionary.

require 'set'
class Node
  attr_accessor :val, :children

  def initialize(val, parent, children = [])
    @val = val
    @parent = nil
    @children = children
  end

  def add_children(dictionary)
    (0...@val.length).each do |i|
      new_word = @val[0..-1]
      ("a".."z").each do |letter|
        new_word[i] = letter
        if dictionary.include?(new_word) && new_word != @val
          @children << Node.new(new_word, self)
        end
      end
    end
  end
end

def bfs(start_word, end_word, dictionary)
  start = Node.new(start_word)
  seen = Set.new(start)
  queue = [start]
  while !queue.empty?
    curr = queue.shift
    if curr.val == end_word
      return construct_path(curr)
    end

    curr.add_children(dictionary)
    curr.children.each do |child|
      if !seen.include?(child.val)
        queue << child
      end
    end
  end
  nil
end

def construct_path(curr)
  path = []
  while !curr.nil?
    path.unshift(curr.val)
    curr = curr.parent
  end
  path
end
