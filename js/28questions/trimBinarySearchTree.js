function trimBST(node, min, max) {
  if (!node) {
    return;
  }

  node.left = trimBST(node.left, min, max);
  node.right = trimBST(node.right, min, max);

  if (node.val >= min && node.val <= max) {
    return node;
  }
  if (node.val < min) {
    return node.right;
  }
  if (node.val > max) {
    return node.left;
  }
}
