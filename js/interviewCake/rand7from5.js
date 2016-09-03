function rand7from5(){
  let res = (rand5() - 1) * 5 + (rand5() - 1);
  while (res > 20) {
    res = (rand5() - 1) * 5 + (rand5() - 1);
  }
  return res % 7 + 1;
}
