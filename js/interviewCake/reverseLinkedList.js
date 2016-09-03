function reverseLinkedList(head){
  let prev = null;
  let currNode = head;
  let nextNode = null;
  while (currNode) {
    nextNode = currNode.next;
    currNode.next = prev;
    prev = currNode;
    currNode = nextNode;
  }
  return prev;
}

function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}
