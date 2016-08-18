//first solution
function oneAway(str1, str2){
  if (str1.length === str2.length) {
    return replace(str1, str2);
  } else if (Math.abs(str1.length - str2.length) === 1) {
    return insertRemove(str1, str2);
  } else {
    return false;
  }
}

function replace(str1, str2) {
  let cntDiff = 0;
  for (let i = 0; i < str1.length; i++){
    if (str1[i] !== str2[i]) {
      cntDiff++;
      if (cntDiff > 1) {
        return false;
      }
    }
  }
  return cntDiff === 1;
}

function insertRemove(str1, str2) {
  let longer;
  if (str1.length > str2.length) {
    longer = str1;
    shorter = str2;
  } else {
    longer = str2;
    shorter = str1;
  }

  let i = 0;
  let j = 0;

  while (i === j){
    if (longer[i] === shorter[j]) {
      i++;
      j++;
    } else {
      i++
    }
  }

  while (i < longer.length) {
    if (longer[i] === shorter[j]) {
      i++;
      j++;
    } else {
      return false;
    }
  }

  return true;
}

//better solution
function oneAway2 (str1, str2) {
  if (str1.length === str2.length) {
    return oneEdit(str1, str2);
  } else if (str1.length - str2.length === 1) {
    return oneInsert(str2, str1);
  } else if (str1.length - str2.length === -1) {
    return oneInsert(str1, str2);
  } else {
    return false;
  }
}

function oneEdit(str1, str2) {
  let foundDifference = false;
  for (let i = 0; i < str1.length; i++) {
    if (str1[i] !== str2[i]) {
      if (foundDifference) {
        return false;
      }
      foundDifference = true;
    }
  }
  return foundDifference;
}

function oneInsert(str1, str2) {
  let i = 0;
  let j = 0;

  while (i < str1.length && j < str2.length) {
    if (str1[i] !== str2[j]) {
      if (i !== j) {
        return false;
      }
      j++;
    } else {
      i++;
      j++;
    }
  }

  return true;
}

//most compact solution
function oneAway3 (str1, str2) {
  if (Math.abs(str1.length - str2.length) > 1) {
    return false;
  }

  const shorter = str1.length > str2.length ? str2 : str1;
  const longer = str1.length > str2.length ? str1 : str2;

  let i = 0;
  let j = 0;

  let foundDifference = false;
  while (i < shorter.length && j < longer.length) {
    if (shorter[i] !== longer[j]) {
      if (foundDifference) {
        return false;
      }
      foundDifference = true;

      if (shorter.length === longer.length) {
        i++
      }

    } else {
      i++;
    }
    j++
  }

  return true;
}

console.log(oneAway2("pale", "ple"));
console.log(oneAway2("pales", "pale"));
console.log(oneAway2("pale", "bale"));
console.log(oneAway2("pale", "bae"));
