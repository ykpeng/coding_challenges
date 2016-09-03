function secondLargest(root){
  let parent = null;
  let curr = root;
  while (curr.right) {
    parent = curr;
    curr = curr.right;
  }
  if (curr.left) {
    curr = curr.left;
    while (curr.right) {
      curr = curr.right;
    }
    return curr;
  } else {
    return parent;
  }
}
