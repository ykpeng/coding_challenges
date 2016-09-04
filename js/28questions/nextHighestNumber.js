function nextHighestNumber(num){
  let digits = String(num).split("").map(char => parseInt(char));

  for (let i = digits.length - 2; i >= 0 ; i--) {
    if (digits[i] < digits[i + 1]) {
      let sorted = countSort(digits.slice(i));
      let nextIdx = sorted.indexOf(digits[i]) + 1;
      let next = sorted[nextIdx];
      sorted.splice(nextIdx, 1);
      let newDigits = digits.slice(0, i).concat(next).concat(sorted);
      return parseInt(newDigits.map(digit => String(digit)).join(""));
    }
  }

  return num;
}

function countSort(digits) {
  let nums = new Array(10);

  digits.forEach(digit => {
    nums[digit] = nums[digit] || 0;
    nums[digit]++;
  })

  let res = [];
  nums.forEach((num, idx) => {
    for (var times = 0; times < num; times++) {
      res.push(idx);
    }
  })
  return res;
}

console.log(nextHighestNumber(52432));
