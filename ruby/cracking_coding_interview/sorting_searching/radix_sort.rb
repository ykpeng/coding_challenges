require 'byebug'

def counting_sort(arr, exp)
  output = []
  count = Array.new(10, 0)

  arr.each do |num|
    digit = (num / exp) % 10
    count[digit] += 1
  end

  (1...count.length).each do |i|
    count[i] += count[i - 1]
  end

  arr.reverse_each do |num|
    digit = (num / exp) % 10
    output[count[digit] - 1] = num
    count[digit] -= 1
  end

  (0...arr.length).each do |i|
    arr[i] = output[i]
  end
end

# time: kn
# space: n
def radix_sort(arr)
  max = arr.max

  exp = 1
  while max / exp > 0
    counting_sort(arr, exp)
    exp *= 10
  end
end

arr = [2,34,48,99,138,100]
radix_sort(arr)
p arr

def counting_sort2(arr)
  output = []
  count = Array.new(10, 0)

  arr.each do |num|
    count[num] += 1
  end

  (1...count.length).each do |i|
    count[i] += count[i - 1]
  end

  arr.each do |num|
    output[count[num] - 1] = num
    count[num] -= 1
  end

  (0...arr.length).each do |i|
    arr[i] = output[i]
  end
end

# arr = [2,9,6,3,7,0,8,6]
# counting_sort2(arr)
# p arr
