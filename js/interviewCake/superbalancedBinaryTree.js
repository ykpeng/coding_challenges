function superBalanced(root){
  const stack = [[root, 0]];
  const depths = [];

  while (stack.length) {
    curr = stack.pop();
    currNode = curr[0];
    currDepth = curr[1];

    if (!currNode.left && !currNode.right) {
      if (!depths.includes(currDepth)) {
        depths.push(currDepth);

        if (depths.length > 2 || (depths.length === 2 && Math.abs(depths[0] - depths[1]) > 1)) {
          return false;
        }
      }
    }
    if (curr.left) {
      stack.push([curr.left, currDepth + 1);
    }
    if (curr.right) {
      stack.push([curr.right, currDepth + 1);
    }
  }

  return true;
}
