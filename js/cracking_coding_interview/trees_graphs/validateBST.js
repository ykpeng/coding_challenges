function validateBST (root, min, max) {
  if (!root) {
    return true;
  }
  if (min && root.val <= min)
    return false;
  }
  if (max && root.val >= max) {
    return false;
  }
  return validateBST(root.left, min, root.val) && validateBST(root.right, root.val, max);
}

validateBST(root, null, null);
