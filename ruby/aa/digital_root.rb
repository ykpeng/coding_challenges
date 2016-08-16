def digital_root(num)
  while num > 9
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += num % 10
    num /= 10
  end
  root
end

p digital_root(345)
p digital_root(13456)
