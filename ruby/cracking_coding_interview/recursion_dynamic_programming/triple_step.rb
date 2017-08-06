# A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a time. Implement a method to count how many possible eways the child can run up the stairs.

# time: 3^n
# space: n
def triple_step(n)
  if n < 0
    return 0
  elsif n == 0
    return 1
  end

  triple_step(n - 1) + triple_step(n - 2) + triple_step(n - 3)
end

# time: n
# space: n
def triple_step2(n, memo)
  if n < 0
    return 0
  elsif n == 0
    return 1
  end

  if !memo[n]
    memo[n] = triple_step2(n - 1, memo) + triple_step2(n - 2, memo) + triple_step2(n - 3, memo)
  end

  memo[n]
end
