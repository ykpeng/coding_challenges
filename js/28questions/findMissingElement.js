function findMissingElement(arr1, arr2){
  let result = 0;
  arr1.concat(arr2).forEach((num)=>{
    result ^= num;
  })
  return result;
}

let arr1 = [4,1,0,2,9,6,8,7,5,3];
let arr2 = [6,4,7,2,1,0,8,3,9];
console.log(findMissingElement(arr1, arr2));
