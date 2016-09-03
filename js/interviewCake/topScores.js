function topScores(unsortedScores, highestPossibleScore){
  const freqs = new Array();
  for (var i = 0; i <= highestPossibleScore; i++) {
    freqs.push(0);
  }

  unsortedScores.forEach(score => {
    freqs[score]++;
  })

  const sorted = [];
  freqs.forEach((freq, idx)=> {
    for (var i = 0; i < freq; i++) {
      sorted.push(idx);
    }
  })

  return sorted;
}
