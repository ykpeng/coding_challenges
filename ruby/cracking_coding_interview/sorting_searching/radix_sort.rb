def counting_sort(arr, exp)
  counts = Array.new(9, 0)
  arr.each do |num|
    digit = (num / exp) % 10
    counts[digit] += 1
  end

  res = []
  counts.each_with_index do |count, idx|
    count.times do
      res << idx
    end
  end

  res
end

def radix_sort(arr)
  max = arr.max

  exp = 1
  while max / exp > 0
    counting_sort(arr, exp)
    exp *= 10
  end

  arr
end
