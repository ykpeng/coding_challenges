function successor(node){
  if (!node) {
    return null;
  }
  if (node.right){
    return leftMost(node.right);
  } else {
    while (node.parent && node === node.parent.right) {
      node = node.parent;
    }
    return node.parent;
  }
}

function leftMost(node){
  if (!node) {
    return null;
  }
  while (node.left !== null) {
    node = node.left;
  }
  return node;
}
