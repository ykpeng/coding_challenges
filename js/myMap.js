Array.prototype.myMap = function (fn) {
  const mapped = [];
  for (let i = 0; i < this.length; i++) {
    mapped.push(fn(this[i]));
  }
  return mapped;
};

let arr = [2,4,5,65,4];
let newArr = arr.myMap( el => el * 2);
console.log(newArr);
