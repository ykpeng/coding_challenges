# time: 2^n
# space: n
def fib1(n)
  if n < 2
    return n
  end

  fib(n - 1) + fib(n - 2)
end

# time: n
# space: n
def fib2(n, memo = [])
  if n < 2
    return n
  end

  if !memo[n]
    memo[n] = fib3(n - 1, memo) + fib3(n - 2, memo)
  end

  memo[n]
end

# time: n
# space: 1
def fib3(n)
  if n < 2
    return n
  end

  a = 0
  b = 1
  2.upto(n) do |i|
    c = a + b
    a = b
    b = c
  end

  c
end
