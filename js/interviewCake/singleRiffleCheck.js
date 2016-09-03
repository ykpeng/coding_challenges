function singleRiffleCheck(deck, half1, half2) {
  if (half1.length + half2.length !== deck.length) {
    return false;
  }

  let pointer1 = 0;
  let pointer2 = 0;
  let pointer1Max = half1.length;
  let pointer2Max = half2.length;

  for (let i = 0; i < deck.length; i++) {
    let currCard = deck[i];
    if (pointer1 < pointer1Max && currCard === half1[pointer1]) {
      pointer1++;
    } else if (pointer2 < pointer2Max && currCard === half2[pointer2]) {
      pointer2++;
    } else {
      return false;
    }
  }

  return true;
}
