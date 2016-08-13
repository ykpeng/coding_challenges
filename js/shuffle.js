function shuffle(arr){
  const newArr = arr.slice(0);
  for (let i = 0; i < arr.length; i++) {
    let randIdx = i + Math.floor(Math.random() * (arr.length - i));
    [ newArr[i], newArr[randIdx] ] = [ newArr[randIdx], newArr[i] ];
  }
  return newArr;
}

let arr = [1,2,3,4,5];
console.log(shuffle(arr));
