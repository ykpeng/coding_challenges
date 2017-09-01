# Given an array of integers, nums and a target value T,  and the number of ways that you can add and subtract the values in nums to add up to T.
# eg.
# nums = {1, 1, 1, 1, 1} T =3
# targetSum(nums, T) = 5

def target_sum(nums, target, i = 0, sum = 0)
  if i == nums.length
    return sum == target ? 1 : 0
  end

  target_sum(nums, target, i + 1, sum + nums[i]) + target_sum(nums, target, i + 1, sum - nums[i])
end

def target_sum2(nums, target, i = 0, sum = 0, cache = Hash.new { |h, k| h[k] = Hash.new })
  if i == nums.length
    return sum == target ? 1 : 0
  end

  if !cache[i][sum]
    cache[i][sum] = target_sum2(nums, target, i + 1, sum + nums[i], cache) + target_sum2(nums, target, i + 1, sum - nums[i], cache)
  end

  cache[i][sum]
end

def target_sum3(nums, target)
  max_sum = nums.inject(0, :+)
  return 0 if max_sum == 0

  cache = Array.new(nums.length + 1) { Array.new(max_sum * 2 + 1, 0) }

  cache[0][max_sum] = 1
  (1..nums.length).each do |i|
    (0...max_sum * 2 + 1).each do |j|
      prev = cache[i - 1][j]
      if prev != 0
        cache[i][j + 1] += prev
        cache[i][j - 1] += prev
      end
    end
  end

  cache[nums.length][max_sum + target]
end

# nums = [1, 1, 1, 1, 1]
nums = [0, 0, 0, 0, 0]
target = 3
p target_sum3(nums, target)
