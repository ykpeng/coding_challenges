function validateBST (root, min = null, max = null) {
  if (!root) {
    return true;
  }
  if (min && root.val <= min || max && root.val > max)
    return false;
  }
  return validateBST(root.left, min, root.val) && validateBST(root.right, root.val, max);
}

validateBST(root, null, null);

//in-order traversal
function checkBST(root, lastPrinted = null) {
  if (node === null) {
    return true;
  }

  if (!checkBST(node.left, lastPrinted)) {
    return false;
  }

  if (lastPrinted !== null && node.val <= lastPrinted) {
    return false;
  }
  lastPrinted = node.data;

  if (!checkBST(node.right, lastPrinted)) {
    return false;
  }

  return true;
}

checkBST(root, null)
