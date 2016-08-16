def shuffle(arr)
  new_arr = arr.dup
  len = arr.length
  arr.each_index do |i|
    rand_idx = i + rand(len - i)
    new_arr[i], new_arr[rand_idx] = new_arr[rand_idx], new_arr[i]
  end
  new_arr
end

arr = [1,2,3,4,5]
p shuffle(arr)
