function isCyclic(head){
  let fastRunner = head;
  let slowRunner = head;

  while (fastRunner && fastRunner.next) {
    fastRunner = fastRunner.next.next;
    slowRunner = slowRunner.next;
    if (fastRunner === slowRunner) {
      return true;
    }
  }

  return false;
}

function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}
