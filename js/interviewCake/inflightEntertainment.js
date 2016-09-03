function twoMovies(flightLength, movieLengths) {
  const seen = new Set();
  for (let i = 0; i < movieLengths.length; i++) {
    let currLength = movieLengths[i];
    let target = flightLength - currLength;
    if (seen.has(target)) {
      return true;
    } else {
      seen.add(currLength);
    }
  }
  return false;
}
