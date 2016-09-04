function sqrt(num){
  if (num < 0) {
    throw new Error("Value can't be negative");
  }

  if (num === 1) {
    return 1;
  }

  let floor = 0;
  let ceiling = num;

  while (ceiling - floor > 1) {
    let guess = Math.floor((floor + ceiling) / 2);
    let square = guess * guess;
    if (square === num) {
      return guess;
    } else if (square < num){
      ceiling = guess;
    } else {
      floor = guess;
    }
  }

  return guess;
}
