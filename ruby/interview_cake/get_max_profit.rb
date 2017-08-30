# Suppose we could access yesterday's stock prices as an array, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
#
# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

# time: n
# space: 1
def get_max_profit(stock_prices_yesterday)
  if stock_prices_yesterday.length < 2
    return nil
  end

  first = stock_prices_yesterday[0]
  second = stock_prices_yesterday[1]
  max_profit = second - first
  min = [first, second].min

  (2...stock_prices_yesterday.length).each do |i|
    curr = stock_prices_yesterday[i]
    curr_profit = curr - min
    if curr_profit > max_profit
      max_profit = curr_profit
    end

    if curr < min
      min = curr
    end
  end

  max_profit
end

stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
stock_prices_yesterday = [10, 7, 5, 4]
stock_prices_yesterday = [-1, -5, -7, -8]


p get_max_profit(stock_prices_yesterday)
