require 'set'

def pair_sum(nums, k)
  pairs = Set.new
  seen = Set.new

  nums.each do |num|
    target = k - num
    if seen.include?(target)
      pairs << [[num, target].min, [num, target].max]
    end
    seen << num
  end

  pairs
end

p pair_sum([1, 2, -1], 0)          # => #<Set: {[-1, 1]}>
p pair_sum([1, 2, -1, -1], 0)      # => #<Set: {[-1, 1]}>
p pair_sum([1, 2, -1, -1, -2], 0)  # => #<Set: {[-1, 1], [-2, 2]}>
p pair_sum([1, 2, -1, -1, -2], 1)  # => #<Set: {[-1, 2]}>
p pair_sum([1, 2, -1, -1, -2], -1) # => #<Set: {[-2, 1]}>
