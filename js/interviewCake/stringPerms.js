function stringPerms(str) {
  if (str.length === 0) {
    return [str];
  }
  let perms = [];
  for (let i = 0; i < str.length; i++) {
    let excised = str.slice(0, i).concat(str.slice(i + 1))
    let subPerms = stringPerms(excised);
    subPerms.forEach(subPerm => {
      let newPerm = str[i].concat(subPerm);
      perms.push(newPerm);
    })
  }
  return perms;
}

console.log(stringPerms("abcd"));
