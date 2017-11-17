# Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
#
# Only one letter can be changed at a time.
# Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
# For example,
#
# Given:
# beginWord = "hit"
# endWord = "cog"
# wordList = ["hot","dot","dog","lot","log","cog"]
# As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
# return its length 5.

require 'set'
require 'byebug'
# class Node
#   attr_accessor :val, :parent, :children
#
#   def initialize(val, parent = nil)
#     @val = val
#     @parent = parent
#   end
#
#   def generate_children(word_list)
#     @children = []
#     (0...@val.length).each do |i|
#       ("a".."z").each do |letter|
#         new_word = @val[0...i] + letter + @val[i + 1..-1]
#         if new_word != @val && word_list.include?(new_word)
#           @children << Node.new(new_word, self)
#         end
#       end
#     end
#     @children
#   end
# end
#
# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
# def ladder_length(begin_word, end_word, word_list)
#   word_list = Set.new(word_list)
#   dest = bfs(begin_word, end_word, word_list)
#
#   length = 0
#   if dest
#     length += 1
#     while !dest.parent.nil?
#       dest = dest.parent
#       length += 1
#     end
#   end
#
#   length
# end
#
# def bfs(begin_word, end_word, word_list)
#   queue = [Node.new(begin_word)]
#   visited = Set.new
#
#   while !queue.empty?
#     curr = queue.shift
#     visited << curr.val
#     if curr.val == end_word
#       return curr
#     end
#     curr.generate_children(word_list)
#     curr.children.each do |child|
#       queue << child if !visited.include?(child.val)
#     end
#   end
#
#   false
# end
def ladder_length(begin_word, end_word, word_list)
  length = 2
  word_list = Set.new(word_list)
  begin_queue = Set.new([begin_word])
  word_list.delete(begin_word)

  if word_list.include?(end_word)
    end_queue = Set.new([end_word])
  else
    return 0
  end

  while !begin_queue.empty?
    children = children(begin_queue)
    begin_queue = word_list & children

    if !(begin_queue & end_queue).empty?
      return length
    end

    if begin_queue.length > end_queue.length
      begin_queue, end_queue = end_queue, begin_queue
    end

    word_list.subtract(begin_queue)

    length += 1
  end

  0
end

def children(words)
  children = Set.new
  words.each do |word|
    (0...word.length).each do |i|
      ("a".."z").each do |letter|
        children << word[0...i] + letter + word[i + 1..-1]
      end
    end
  end
  children
end

def construct_mapping(word_list)
  mapping = Hash.new { |h, k| h[k] = Array.new }
  word_list.each do |word|
    (0...word.length).each do |i|
      key = word[0...i] + "_" + word[i + 1..-1]
      mapping[key] << word
    end
  end
  mapping
end

# begin_word = "a"
# end_word = "c"
# word_list = ["a", "b", "c"]
begin_word = "hit"
end_word = "cog"
word_list =["hot","dot","dog","lot","log","cog"]
# p ladder_length(begin_word, end_word, word_list)
p construct_mapping(word_list)
