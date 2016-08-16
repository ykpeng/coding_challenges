function isUniq (str) {
  let sorted = str.split("").sort();
  for (let i = 0; i < sorted.length - 1; i++) {
    if (sorted[i] === sorted[i + 1]) {
      return false;
  }
  return true;
}

function isUniq2 (str) {
  if (str.length > 128) {
    return false;
  }

  const charSet = new Array(128);
  for (let i = 0; i < str.length; i++) {
    let code = str[i].charCodeAt();
    if (charSet[code] === true) {
      return false;
    }
    charSet[code] = true;
  }
  return true;
}

console.log(isUniq2("awfkbnepri"));
console.log(isUniq2("awfkbnadsfpri"));
