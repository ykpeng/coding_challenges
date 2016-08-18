function deleteMiddleNode (node) {
  if (node === null || node.next === null) {
    return false;
  }
  node.val = node.next.val;
  node.next = node.next.next;
  return true;
}
