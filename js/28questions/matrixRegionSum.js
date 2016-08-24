function precomputeSums(matrix){
  const topRow= 0;
  const bottomRow = matrix.length - 1;
  const leftCol = 0;
  const rightCol = matrix[0].length - 1;

  const sums = new Array();
  for (let row = 0; row < matrix.length; row++) {
    let sub = [];
    for (let col = 0; col < matrix[row].length; col++) {
      sub.push(0);
    }
    sums.push(sub);
  }

  sums[topRow][leftCol] = matrix[topRow][leftCol];

  for (let col = leftCol + 1; col <= rightCol; col++) {
    sums[topRow][col] = sums[topRow][col - 1] + matrix[topRow][col];
  }
  for (let row = topRow + 1; row <= bottomRow; row++) {
    sums[row][leftCol] = sums[row - 1][leftCol] + matrix[row][leftCol];
  }

  for (let col = leftCol + 1; col <= rightCol; col++) {
    let columnSum = matrix[topRow][col];
    for (let row = topRow + 1; row <= bottomRow; row++) {
      sums[row][col] = sums[row][col - 1] + matrix[row][col] + columnSum;
      columnSum += matrix[row][col];
    }
  }
  return sums;
}

function matrixRegionSum(matrix, a, d, sums){
  if (matrix.length === 0) {
    return;
  }

  let oa;
  let oc;
  let ob;

  if (a[0] === 0 || a[1] === 0) {
    oa = 0;
  } else {
    oa = sums[a[0] - 1][a[1] - 1];
  }

  if (a[1] === 0) {
    oc = 0;
  } else {
    oc = sums[d[0]][a[1] - 1];
  }

  if (a[0] === 0) {
    ob = 0;
  } else {
    ob = sums[a[0] - 1][d[1]];
  }

  let od = sums[d[0]][d[1]];

  return od - ob - oc + oa;
}
