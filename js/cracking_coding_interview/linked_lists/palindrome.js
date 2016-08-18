function palindrome (head) {
  const reversed = reverseAndClone(head);
  return isEqual(head, reversed);
}

function reverseAndClone (node) {
  let head = null;
  while (node !== null) {
    n = new Node(node.data);
    n.next = head;
    head = n;
    node = node.next;
  }
  return head;
}

isEqual(node1, node2) {
  while (node1 !== null && node2 !== null) {
    if (node1.val !== node2.val) {
      return false;
    }
    node1 = node1.next;
    node2 = node2.next;
  }
  return node1 === null && node2 === null;
}

// TODO: runners solution and recursive solution
