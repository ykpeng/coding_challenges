for (let i = 0; i < 10; i++) {
  const res = [];
  res.push(function(){
    return i;
  });
  console.log(res);
  return res;
}

function createBase(base) {
  const sum_base = base;
  function fn(num) {
    return sum_base + num;
  }
  return fn;
}

const addSix = createBase(6);
addSix(10); // returns 16
addSix(21); // returns 27
