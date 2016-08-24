function isBST(root, min = Number.NEGATIVE_INFINITY, max = Number.POSITIVE_INFINITY){
  if (!root) {
    return true;
  }

  if (!(min < root.val < max)) {
    return false;
  }

  return isBST(root.left, min, root.val) && isBST(root.right, root.val, max);
}
