function checkBalance(root) {
  if (!root) {
    return true;
  }

  let leftDepth = checkDepth(root.left);
  let rightDepth = checkDepth(root.right);
  let diff = Math.abs(leftDepth - rightDepth);

  return checkBalance(root.left) && checkBalance(root.right) && diff < 2;
}

function checkDepth(node) {
  if (!node) {
    return 0;
  }
  return Math.max(checkDepth(node.left), checkDepth(node.right)) + 1;
}

// TODO: error handling for more efficient solution
