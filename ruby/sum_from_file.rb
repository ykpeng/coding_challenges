def sum_from_file(filename)
  nums = File
    .readlines(filename)
    .select { |num| num[0] != "#" }
    .map(&:to_i)
  nums.inject(0, :+)
end
