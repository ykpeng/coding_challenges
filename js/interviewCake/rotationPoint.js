function rotationPoint(words, floorIdx = 0, ceilingIdx = words.length - 1){
  while (ceilingIdx > floorIdx + 1) {
    let midIdx = Math.floor((floorIdx + ceilingIdx) / 2);
    if (words[midIdx] < words[0]) {
      ceilingIdx = midIdx - 1;
    } else if (words[midIdx] > words[0]) {
      floorIdx = midIdx + 1;
    }
  }
  return ceilingIdx;
}
