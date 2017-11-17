# @param {Float} x
# @param {Integer} n
# @return {Float}
# def my_pow(x, n)
#   if n < 0
#     res = 1
#     log(n.abs).times do
#       res *= x
#       x = res
#     end
#
#     return 1/res
#   elsif n == 0
#     return x/x
#   else
#     res = 1
#     log(n).times do
#       res *= x
#       x = res
#     end
#     log(n)
#     return res
#   end
# end
#
# def log(n)
#   res = 0
#   while n > 1
#     res += 1
#     n = n / 2
#   end
#   res
# end

def my_pow(x, n)
  if n == 0
    return x/x
  end

  if n == 1
    return x
  end

  if n == -1
    return 1/x
  end

  half = my_pow(x, n/2)
  res = half * half
  if n.odd?
    res *= x
  end
  return res
end

def my_pow(x, n)
  if n == 0
    return x/x
  end
  if n < 0
    n = -n
    x = 1/x
  end

  res = my_pow(x * x, n/2)
  if n.odd?
    res *= x
  end
end
