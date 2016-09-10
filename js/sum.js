// sum(2, 7)
// sum(2)(7)

// function sum(x, y) {
//   if (arguments.length === 2) {
//     return arguments[0] + arguments[1];
//   } else {
//     return function(y) {
//       return x + y;
//     };
//   }
// }

function sum(x, y) {
  if (y) {
    return x + y;
  } else {
    return function(y) {
      return x + y
    }
  }
}
// console.log(sum(2, 7));
// console.log(sum(2)(7));

// 122
