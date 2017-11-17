def insertion_sort(arr)
  (1...arr.length).each do |i|
    j = i
    while j > 0 && arr[j] < arr[j - 1]
      arr[j], arr[j - 1] = arr[j - 1], arr[j]
      j -= 1
    end
  end
end

arr = [5, 12, 11, 13, 6, 7]
insertion_sort(arr)
p arr
