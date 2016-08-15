def productify(nums)
  products = Array.new(nums.length, 1)

  lower_prod = 1
  nums.each_index do |i|
    products[i] *= lower_prod
    lower_prod *= nums[i]
  end

  upper_prod = 1
  (nums.length - 1).downto(0) do |j|
    products[j] *= upper_prod
    upper_prod *= nums[j]
  end

  products
end

p productify([1,2,3,4,5])
