function treeLevelOrder(root){
  if (!root) {
    return;
  }
  const queue = [root];
  const currCnt = 1;
  const nextCnt = 0;

  while (queue.length !== 0) {
    let currNode = queue.shift();
    currCnt--;
    console.log(currNode.val);

    if (root.left) {
      queue.push(root.left);
      nextCnt++;
    }
    if (root.right) {
      queue.push(root.right);
      nextCnt++;
    }
    if (currCnt === 0) {
      console.log(\n);
      currCnt = nextCnt;
      nextCnt = 0;
    }
  }
}
