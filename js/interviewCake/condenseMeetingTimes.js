function condenseMeetingTimes(times){
  let sorted = times.slice().sort((a, b)=> { a.startTime - b.startTime });
  let merged = [sorted[0]];

  for (let i = 1; i < sorted.length; i++) {
    let curr = sorted[i];
    let lastMerged = merged[merged.length - 1];
    if (curr.startTime <= lastMerged.endTime) {
      lastMerged.endTime = Math.max(lastMerged.endTime, curr.endTime)};
    } else {
      merged.push(curr);
    }
  }

  return merged;
}
