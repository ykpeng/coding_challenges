# Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
#
# Each element is either an integer, or a list -- whose elements may also be integers or other lists.
#
# Different from the previous question where weight is increasing from root to leaf, now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.
#
# Example 1:
# Given the list [[1,1],2,[1,1]], return 8. (four 1's at depth 1, one 2 at depth 2)
#
# Example 2:
# Given the list [1,[4,[6]]], return 17. (one 1 at depth 3, one 4 at depth 2, and one 6 at depth 1; 1*3 + 4*2 + 6*1 = 17)

def build_weights(arr, weights, depth = 1)
  arr.each do |el|
    if el.is_a?(Array)
      build_weights(el, weights, depth + 1)
    else
      weights[depth] << el
    end
  end
end

def weighted_sum(weights)
  max_weight = weights.keys.max
  sum = 0
  weights.each do |weight, values|
    reversed_weight = max_weight - weight + 1
    sum += reversed_weight * values.inject(0, :+)
  end
  sum
end

def find_weighted_sum(arr)
  weights = Hash.new { |h, k| h[k] = Array.new }
  build_weights(arr, weights)
  weighted_sum(weights)
end

# arr1 = [[1,1],2,[1,1]]
# puts find_weighted_sum(arr1) == 8
# arr2 = [1,[4,[6]]]
# puts find_weighted_sum(arr2) == 17

def weighted_sum_inverse(arr)
  unweighted, weighted = 0, 0
  curr_level = arr
  
  while !curr_level.empty?
    next_level = []
    curr_level.each do |el|
      if el.is_a?(Array)
        next_level.concat(el)
      else
        unweighted += el
      end
    end
    weighted += unweighted
    curr_level = next_level
  end

  weighted
end

arr1 = [[1,1],2,[1,1]]
puts weighted_sum_inverse(arr1) == 8
arr2 = [1,[4,[6]]]
puts weighted_sum_inverse(arr2) == 17
