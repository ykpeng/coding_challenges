function strPerms(str){
  if (str.length < 2) {
    return [str];
  }
  const perms = [];
  for (let i = 0; i < str.length; i++) {
    let left = str.slice(0, i);
    let right = str.slice(i + 1);
    let sub = left.concat(right);
    let subPerms = strPerms(sub);
    subPerms.forEach((subPerm)=>{
      let newPerm = str[i].concat(subPerm);
      perms.push(newPerm);
    })
  }
  return perms;
}

function arrPerms(arr){
  if (arr.length < 2) {
    return [arr];
  }
  const perms = [];
  for (let i = 0; i < arr.length; i++) {
    let left = arr.slice(0, i);
    let right = arr.slice(i + 1);
    let sub = left.concat(right);
    let subPerms = arrPerms(sub);
    subPerms.forEach((subPerm)=>{
      let newPerm = [arr[i]].concat(subPerm);
      perms.push(newPerm);
    })
  }
  return perms;
}

function strPerms2(str) {
  if (str.length < 2) {
    return [str];
  }

  const perms = strPerms2(str.slice(1));
  const char = str[0];
  const res = [];
  perms.forEach((perm)=>{
    for (let i = 0; i < perm.length + 1; i++) {
      let newPerm = perm.slice(0, i).concat(char).concat(perm.slice(i));
      res.push(newPerm);
    }
  })
  return res;
}


// console.log(arrPerms([1, 2, 3, 4]));
console.log(strPerms2("abcd"));
