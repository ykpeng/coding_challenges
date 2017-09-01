def make_change(coins, target)
  return 0 if target == 0

  min_coins = 1.0/0.0

  coins.each do |coin|
    remainder = target - coin
    if remainder >= 0
      curr_min_coins = make_change(coins, remainder)
      if curr_min_coins < min_coins
        min_coins = curr_min_coins
      end
    end
  end

  min_coins + 1
end

def make_change2(coins, target, cache = [])
  return 0 if target == 0

  cached = cache[target]

  if !cached
    min_coins = 1.0/0.0

    coins.each do |coin|
      remainder = target - coin
      if remainder >= 0
        curr_min_coins = make_change2(coins, remainder)
        if curr_min_coins < min_coins
          min_coins = curr_min_coins
        end
      end
    end

    cache[target] = min_coins + 1
  end

  cache[target]
end

def make_change3(coins, target)
  cache = [0]

  (1..target).each do |amount|
    min_coins = 1.0/0.0
    coins.each do |coin|
      remainder = amount - coin
      if remainder >= 0
        curr_min_coins = cache[remainder]
        if curr_min_coins < min_coins
          min_coins = curr_min_coins
        end
      end
    end
    cache[amount] = min_coins + 1
  end

  cache[target]
end

coins = [10, 6, 1]
target = 12
p make_change2(coins, target)
