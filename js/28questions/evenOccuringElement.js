function evenOccuringElement(arr){
  const freqs = {};
  arr.forEach((num)=>{
    freqs[num] = freqs[num] || 0;
    freqs[num] += 1;
  })

  for (num in freqs) {
    if (freqs[num] % 2 === 0) {
      return num;
    }
  }
}
