def knapsack(values, weights, max_weight, i = 0)
  if i == values.length
    return 0
  end

  if weights[i] > max_weight
    return knapsack(values, weights, max_weight, i + 1)
  end

  with_curr = knapsack(values, weights, max_weight - weights[i], i + 1) + values[i]
  without_curr = knapsack(values, weights, max_weight, i + 1)
  [with_curr, without_curr].max
end

def knapsack2(values, weights, max_weight, i = 0, cache = Hash.new { |h, k| h[k] = Hash.new })
  if i == values.length
    return 0
  end

  if !cache[i][max_weight]
    if weights[i] > max_weight
      cache[i][max_weight] = knapsack2(values, weights, max_weight, i + 1)
    else
      with_curr = knapsack2(values, weights, max_weight - weights[i], i + 1) + values[i]
      without_curr = knapsack2(values, weights, max_weight, i + 1)
      cache[i][max_weight] = [with_curr, without_curr].max
    end
  end

  cache[i][max_weight]
end

def knapsack3(values, weights, max_weight)
  cache = Array.new(values.length + 1) { Array.new(max_weight + 1) }

  cache[0].each do |weight|
    cache[0][weight] = 0
  end

  (1...cache.length).each do |i|
    (0...cache[0].length).each do |weight|
      if weights[i - 1] > weight
        cache[i][weight] = cache[i - 1][weight]
      else
        with_curr = cache[i - 1][weight - weights[i - 1]] + values[i - 1]
        without_curr = cache[i - 1][weight]
        cache[i][weight] = [with_curr, without_curr].max
      end
    end
  end

  cache[values.length][max_weight]
end

values = [6, 10, 12]
weights = [2, 2, 3]
max_weight = 5
p knapsack3(values, weights, max_weight)
