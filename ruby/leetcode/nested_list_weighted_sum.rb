# Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
#
# Each element is either an integer, or a list -- whose elements may also be integers or other lists.
#
# Example 1:
# Given the list [[1,1],2,[1,1]], return 10. (four 1's at depth 2, one 2 at depth 1)
#
# Example 2:
# Given the list [1,[4,[6]]], return 27. (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27)

# [[1,1],2,[1,1],2] = 2*2 + 4 + 2*2 = 12

def weighted_sum(arr, depth = 1)
  curr_sum = 0
  arr.each_with_index do |el, i|
    if el.is_a?(Array)
      curr_sum += weighted_sum(el, depth + 1)
    else
      curr_sum += el * depth
    end
  end
  curr_sum
end

arr1 = [[1,1],2,[1,1],2]
p weighted_sum(arr1) == 12
arr2 = [1,[4,[6]]]
p weighted_sum(arr2) == 27
