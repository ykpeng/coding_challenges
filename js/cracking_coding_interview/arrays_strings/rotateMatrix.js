function rotateMatrix (matrix) {
  if (matrix.length === 0 || matrix.length !== matrix[0].length) {
    return false;
  }

  const length = matrix.length;
  for (let layer = 0; layer < length / 2; layer++) {
    let last = length - 1 - layer;
    for (let i = layer; i < last; i++) {
      let offset = i - layer;
      let top = matrix[layer][i];
      matrix[layer][i] = matrix[last - offset][layer];
      matrix[last - offset][layer] = matrix[last][last - offset];
      matrix[last][last - offset] = matrix[i][last];
      matrix[i][last] = top;
    }
  }
  console.log(matrix);
  return true;
}

console.log(rotateMatrix([[1,2,3,4],
                          [4,6,7,8],
                          [9,10,11,12],
                          [13,14,15,16]]));
