# Design an algorithm to find all pairs of integers within an array which sum to a specified value.

# time: nlogn
def pair_sum(arr, target)
  pairs = []

  arr.sort!

  i = 0
  j = arr.length - 1

  while i < j
    sum = arr[i] + arr[j]
    if sum == target
      pairs << [i, j]
      i += 1
      j -= 1
    elsif sum < target
      i += 1
    else
      j -= 1
    end
  end

  pairs
end
