// const p1 = Promise.resolve(3);
// const p2 = 1337;
// const p3 = new Promise((resolve, reject) => {
//   setTimeout(reject, 100, "foo");
// });
//
// Promise.all([p1, p2, p3]).then(values => {
//   console.log(values); // [3, 1337, "foo"]
// }, values => {
//   console.log(values);
// });

const fn1 = new Promise((resolve, reject) => {
  setTimeout(resolve, 100, "fn1");
});

function success(msg){
  resolve(`msg ${succeeded}`);
};

function failure(msg){
  reject(`msg ${failed}`);
};

function success2(msg){
  console.log(msg);
}
fn1.then(success, failure).then(success2);
// .then(fn2).then(fn3).catch(()=>{console.log("failed");});
