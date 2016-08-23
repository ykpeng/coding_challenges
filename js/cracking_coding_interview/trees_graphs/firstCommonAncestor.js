//Design an algorithm and write code to find the first common ancestor of two nodes in a binary tree. Avoid storing additional nodes in a data structure. NOTE: This is not necessarily a binary search tree.

//with link to parent
function firstCommonAncestor(root, p, q){
  if (!covers(root, p) || !covers(root, q)) {
    return null;
  } else if (covers(p, q)) {
    return p;
  } else if (covers(q, p)) {
    return q;
  }

  let sibling = getSibling(p);
  let parent = p.parent;
  while (!covers(sibling, q)) {
    sibling = getSibling(parent);
    parent = parent.parent;
  }
  return parent;
}

function covers(root, p){
  if (!root) {
    return false;
  }
  if (root === p) {
    return true;
  }
  return covers(root.left, p) || covers(root.right, p);
}

function getSibling(node){
  if (!node || !node.parent) {
    return null;
  }
  const parent = node.parent;
  return parent.left === node ? parent.right : parent.left;
}

//without link to parent
function firstCommonAncestor2(node, p, q){
  if (!covers(root, p) || !covers(root, q)) {
    return null;
  }
  return ancestorHelper(root, p, q);
}

function ancestorHelper(root, p, q) {
  if (!root || root === p || root === q) {
    return root;
  }

  let pIsOnLeft = covers(root.left, p);
  let qIsOnLeft = covers(root.left, q);
  if (pIsOnLeft !== qIsOnLeft) {
    return root;
  }
  childSide = pIsOnLeft ? root.left : root.right;
  return ancestorHelper(childSide, p, q);
}

function covers(root, p){
  if (!root) {
    return false;
  }
  if (root === p) {
    return true;
  }
  return covers(root.left, p) || covers(root.right, p);
}

// TODO: more efficient solution
