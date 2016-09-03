function kthToLast(head, k){
  if (k < 1) {
    throw new Error("k can't be less than 1");
  }
  let runner1 = head;
  let runner2 = head;

  for (var i = 0; i < k - 1; i++) {
    if (!runner1.next) {
      throw new Error("list shorter than k");
    }
    runner1 = runner1.next;
  }

  while (runner1.next) {
    runner1 = runner1.next;
    runner2 = runner2.next;
  }

  return runner2;
}

function LinkedListNode(value) {
  this.value = value;
  this.next = null;
}
