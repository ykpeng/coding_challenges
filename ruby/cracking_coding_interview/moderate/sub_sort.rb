# O(n)
def sub_sort(arr)
  m = 0
  (0...arr.length - 1).each do |i|
    if arr[i] > arr[i + 1]
      m = i
      break
    end
  end

  n = arr.length - 1
  (arr.length - 1).downto(1) do |j|
    if arr[j] < arr[j - 1]
      n = j
      break
    end
  end

  min = arr[m]
  max = arr[m]
  (m + 1..n).each do |idx|
    if arr[idx] < min
      min = arr[idx]
    end
    if arr[idx] > max
      max = arr[idx]
    end
  end

  while m - 1 >= 0 && min < arr[m - 1]
    m -= 1
  end

  while n + 1 < arr.length && max > arr[n + 1]
    n += 1
  end

  [m, n]
end

# arr = [1,2,4,7,10,11,7,12,6,7,16,18,19]
# arr = [5,4,3,6,7,8]
arr = [1,2,3,8,6,3]
p sub_sort(arr)
