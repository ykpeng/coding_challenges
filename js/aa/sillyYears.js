function sillyYears(year) {
  const years = [];
  let currYear = year + 1;
  while (years.length < 10) {
    if (isSilly(currYear)) {
      years.push(currYear);
    }
    currYear++
  }
  return years;
}

function isSilly(year) {
  const yearS = year.toString();
  const left = yearS.slice(0, 2);
  const right = yearS.slice(2);
  const mid = yearS.slice(1,3);
  return parseInt(left) + parseInt(right) === parseInt(mid);
}

console.log(sillyYears(1989));
