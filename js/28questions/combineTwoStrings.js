function isShuffle(str1, str2, str3, cache = {}){
  if (cache[[str1, str2]]) {
    return false;
  }

  if (str1.length + str2.length !== str3.length) {
    return false;
  }

  if (!str1 || !str2 || !str3) {
    return (str1 + str2 === str3);
  }

  if (str1[0] !== str3[0] && str2[0] !== str3[0]) {
    return false;
  }

  if (str1[0] === str3[0] && isShuffle(str1.slice(1), str2, str3.slice(1), cache)) {
    return true;
  }

  if (str2[0] === str3[0] && isShuffle(str1, str2.slice(1), str3.slice(1), cache)) {
    return true;
  }

  cache[[str1, str2]] = true;
}

let str1 = "dope";
let str2 = "due";
let str3 = "duddopee";
console.log(isShuffle(str1, str2, str3));
