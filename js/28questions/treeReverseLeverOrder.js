function treeReverseLevelOrder(root){
  if (!root) {
    return;
  }

  const queue = [root];
  const currCnt = 1;
  const nextCnt = 0;
  const cnts = [1];
  let i = 0;

  while (i < queue.length) {
    let currNode = queue[i];
    currCnt--;

    if (root.left) {
      queue.push(root.left);
      nextCnt++;
    }
    if (root.right) {
      queue.push(root.right);
      nextCnt++;
    }
    if (currCnt === 0) {
      if (nextCnt == 0) {
        break;
      }
      res.push("\n");
      currCnt = nextCnt;
      cnts.push(currCnt);
      nextCnt = 0;
    }
  }
}
