for (let i = 0; i < 10; i++) {
  const res = [];
  res.push(function(){
    return i;
  });
  console.log(res);
  return res;
}
