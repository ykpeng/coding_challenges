def sum_rec(nums)
  if nums.empty?
    return 0
  end
  nums[0] + sum_rec(nums[1..-1])
end

p sum_rec([1,2,3,4,5])
