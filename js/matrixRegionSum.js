function matrixRegionSum (matrix, topLeftCoords, bottomRightCoords) {
  const startCol = topLeftCoords[0]
       ,startRow = topLeftCoords[1]
       ,endCol = bottomRightCoords[0]
       ,endRow = bottomRightCoords[1];

  let sum = 0;
  for (let i = startRow; i <= endRow; i++) {
    for (let j = startCol; j <= endCol; j++) {
      sum += matrix[i][j];
    }
  }

  return sum;
}

let matrix = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

console.log(matrixRegionSum(matrix, [0,0], [1,1]));
