function pathSum(root, sum){
  if (!root) {
    return false;
  }

  if (!root.left && !root.right && root.val === sum) {
    return true;
  }

  let target = sum - root.val;
  return pathSum(root.left, target) || pathSum(root.right, target);
}
