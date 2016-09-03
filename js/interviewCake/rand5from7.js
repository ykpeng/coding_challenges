function rand5from7() {
  let res = 7;
  while (res > 5) {
    res = rand7();
  }
  return res;
}
