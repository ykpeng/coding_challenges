function changePossibilities(amount, coins) {
  const ways = [];
  for (var i = 0; i < amount; i++) {
    ways[i] = 0;
  }
  ways[0] = 1;

  for (let j = 0; j < coins.length; j++) {
    let coin = coins[j];
    for (let higherAmount = coin; higherAmount <= amount; higherAmount++) {
      let higherAmountRemainder = higherAmount - coin;
      ways[higherAmount] += ways[higherAmountRemainder];
    }
  }

  return ways[amount];
}

// TODO: review
