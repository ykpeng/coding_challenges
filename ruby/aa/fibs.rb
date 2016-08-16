def fibs(num)
  curr_fibs = [0, 1]

  if num < 3
    return curr_fibs.take(num)
  end

  while curr_fibs.length < num
    curr_fibs << curr_fibs[-1] + curr_fibs[-2]
  end

  curr_fibs
end

p fibs(6)
