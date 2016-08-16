def largest_cont_sub_sum(nums)
  max_sum = 0
  curr_sum = 0

  nums.each do |num|
    curr_sum += num
    max_sum = curr_sum if curr_sum > max_sum
    curr_sum = 0 if curr_sum < 0
  end

  max_sum
end

p largest_cont_sub_sum([4,5,-3,2,-6])
