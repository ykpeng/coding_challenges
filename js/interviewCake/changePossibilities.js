function changePossibilities(amount, coins) {
  const ways = [];
  for (let i = 0; i < amount; i++) {
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

function changePoss(amount, coins) {
  console.log(`checking ways to make ${amount} with ${coins}`);
  if (amount === 0) {
    return 1;
  }
  let ways = 0;
  for (let i = 0; i < coins.length; i++) {
    let currCoin = coins[i];
    if (currCoin <= amount) {
      let remainder = amount - currCoin;
      ways += changePoss(remainder, coins.slice(i));
    }
  }
  return ways;
}

console.log(changePoss(4, [1,2,3]));
