function zeroMatrix(matrix) {
  const zeroRows = new Set();
  const zeroCols = new Set();

  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[0].length; j++) {
      if (matrix[i][j] === 0) {
        zeroRows.add(i);
        zeroCols.add(j);
      }
    }
  }

  zeroRows.forEach((row) => {
    for (let j = 0; j < matrix[0].length; j++) {
      matrix[row][j] = 0;
    }
  })

  zeroCols.forEach((col) => {
    for (let i = 0; i < matrix.length; i++) {
      matrix[i][col] = 0;
    }
  })

  return matrix;
}

// TODO: inplace solution

console.log(zeroMatrix([[1,2,3,4],
                        [5,0,6,7],
                        [8,9,10,11],
                        [12,13,14,15]]));
