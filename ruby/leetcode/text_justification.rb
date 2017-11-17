require 'byebug'
# Given an array of words and a length L, format the text such that each line has exactly L characters and is fully (left and right) justified.
# 
# You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly L characters.
# 
# Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
# 
# For the last line of text, it should be left justified and no extra space is inserted between words.
# 
# For example,
# words: ["This", "is", "an", "example", "of", "text", "justification."]
# L: 16.
# 
# Return the formatted lines as:
# [
#    "This    is    an",
#    "example  of text",
#    "justification.  "
# ]
# Note: Each word is guaranteed not to exceed L in length.

# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
# def full_justify(words, max_width)
#   res = []
#   curr = []
#   num_of_letters = 0
# 
#   words.each do |word|
#     if num_of_letters + word.length + curr.length > max_width
#       spaces_remaining = max_width - num_of_letters
#       (0...spaces_remaining).each do |i|
#         mod_val = curr.length > 1 ? curr.length - 1 : 1
#         curr[ i % mod_val ] += ' '
#       end
# 
#       res << curr.join('')
#       curr = []
#       num_of_letters = 0
#     end
# 
#     curr << word
#     num_of_letters += word.length
#   end
# 
#   res << curr.join(' ').ljust(max_width)
# end

def full_justify(words, max_width)
  res = []
  curr_line = []
  curr_num_letters = 0
  
  words.each do |word|
    if curr_num_letters + curr_line.length + word.length > max_width
      # distribute spaces
      spaces_remaining = max_width - curr_num_letters
      mod_val = curr_line.length > 1 ? curr_line.length - 1 : 1
      (0...spaces_remaining).each do |i|
        curr_line[ i % mod_val ] << " "
      end
      
      res << curr_line.join("")
      curr_line = []
      curr_num_letters = 0
    end
    
    curr_line << word
    curr_num_letters += word.length
  end
  
  # handle last line
  last_line = curr_line.join(" ")
  while last_line.length < max_width
    last_line << " "
  end
  res << last_line
end

words = ["This", "is", "an", "example", "of", "text", "justification."]
max_width = 16
p full_justify(words, max_width)