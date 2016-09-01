function getMaxProfit(prices){
  if (prices.length < 2) {
    throw new Error("Must have at least 2 prices");
  }

  let currMin = prices[0];
  let max = prices[1] - prices[0];

  for (let i = 1; i < prices.length; i++) {
    if (prices[i] - currMin > max) {
      max = prices[i] - currMin;
    }
    if (prices[i] < currMin) {
      currMin = prices[i];
    }
  }

  return max;
}

console.log(getMaxProfit([10, 7, 5, 8, 11, 9]));
