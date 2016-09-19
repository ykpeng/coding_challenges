// Array.prototype.asyncEach = function(fn, idx = 0) {
//   if (idx === this.length) {
//     return;
//   }
//   fn(this[idx]);
//   self = this;
//   setTimeout(function(){
//     self.asyncEach(fn, idx + 1);
//   }, 1000);
// }

// Array.prototype.asyncEach = function (fn) {
//   for (let i = 0; i < this.length; i++) {
//     (function(idx) {
//       setTimeout(()=>{
//         fn(idx);
//       }, 1000 * idx)
//     })(i);
//   }
// };

Array.prototype.asyncEach = function (fn) {
  for (let i = 0; i < this.length; i++) {
    doSetTimeout(i);
  }

  function doSetTimeout(idx) {
    setTimeout(()=>{
      fn(idx);
    }, 1000 * idx);
  }
};

Array.prototype.asyncMap = function(fn, idx = 0, mapped = []) {
  if (idx === this.length) {
    return mapped;
  }
  mapped.push(fn(this[idx]));
  setTimeout(() => {
    this.asyncMap(fn, idx + 1, mapped);
  }, 1000);
}

const arr = [1,2,3,4,5];
arr.asyncMap(function(el){ return el * 2; });
