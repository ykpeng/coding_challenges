function deleteNode(node){
  let nextNode = node.next;

  if (nextNode) {
    node.value = nextNode.value;
    node.next = nextNode.next;
  } else {
    throw new Error("Can't delete the last node with this method");
  }
}

function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}
