function uniqSubs(str){
  const uniqs = new Set();

  for (let i = 0; i < str.length; i++) {
    for (let j = i + 1; j <= str.length; j++) {
      uniqs.add(str.slice(i, j));
    }
  }

  return uniqs;
}


console.log(uniqSubs("bobobobob"));
