# You are given weights and values of N items, put these items in a knapsack of capacity W to get the maximum total value in the knapsack. Note that we have only one quantity of each item, In other words, given two integer arrays val[0..N-1] and wt[0..N-1] which represent values and weights associated with N items respectively. Also given an integer W which represents knapsack capacity, find out the maximum value subset of val[] such that sum of the weights of this subset is smaller than or equal to W. You cannot break an item, either pick the complete item, or don’t pick it (0-1 property).

def knapsack(vals, weights, max_cap, num_items)
  max_vals = Array.new(num_items + 1) { Array.new(max_cap + 1) }
  0.upto(max_cap) do |weight|
    max_vals[0][weight] = 0
  end

  (1).upto(num_items) do |n|
    (0).upto(max_cap) do |w|
      if weights[n - 1] > w
        max_vals[n][w] = max_vals[n - 1][w]
      else
        dont_take_curr = max_vals[n - 1][w]
        take_curr = max_vals[n - 1][w - weights[n - 1]] + vals[n - 1]
        max_vals[n][w] = [dont_take_curr, take_curr].max
      end
    end
  end

  max_vals[num_items][max_cap]
end

vals = [3, 2, 4, 4]
weights = [4, 3, 2, 3]
max_cap = 6
p knapsack(vals, weights, max_cap, num_items = vals.length)
