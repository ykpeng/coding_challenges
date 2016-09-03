function rangeOverlap(point1, length1, point2, length2){
  let highestStartPoint = Math.max(point1, point2);
  let lowestEndPoint = Math.min(point1 + length1, point2 + length2);

  if (highestStartPoint >= lowestEndPoint) {
    return { startPoint: null, overlapLength: null };
  } else {
    return { startPoint: highestStartPoint, overlapLength: lowestEndPoint - highestStartPoint }
  }
}

function rectangularOverlap(rect1, rect2) {
  let x = rangeOverlap(rect1.leftX, rect1.width, rect2.leftX, rect2.length);
  let y = rangeOverlap(rect1.leftY, rect1.width, rect2.leftY, rect2.length);

  return {
    leftX: x.startPoint,
    bottomY: y.startPoint,
    width: x.overlapLength,
    height: y.overlapLength
  }
}
