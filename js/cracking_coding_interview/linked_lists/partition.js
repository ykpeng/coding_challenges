function partition (head, partitionVal) {
  let newHead = head;
  let newTail = head;

  let currNode = head;
  while (currNode !== null) {
    let next = currNode.next;
    if (currNode.val < partitionVal) {
      currNode.next = newHead;
      newHead = currNode;
    } else {
      newTail.next = currNode;
      newTail = currNode;
    }
    currNode = next;
  }

  return newHead;
}
