# You are given an array of integers (both positive and negative). Find the contiguous sequence with the largest sum. Return the sum.

# time: n
# space: 1
def contiguous_sequence(arr)
  max = arr[0]
  curr = arr[0]

  arr[1..-1].each do |num|
    new_sum = curr + num
    if new_sum < 0
      curr = 0
    else
      curr = new_sum
      if curr > max
        max = curr
      end
    end
  end

  max
end

arr = [2, -8, 3, -2, 4, -10]
max = 2
curr = 2
new_sum = -6

p contiguous_sequence(arr)

def contiguous_sequence2(arr)
  max_sum = 0
  curr_sum = 0

  arr.each do |num|
    curr_sum += num
    if curr_sum > max_sum
      max_sum = curr_sum
    elsif curr_sum < 0
      curr_sum = 0
    end
  end

  max_sum
end
