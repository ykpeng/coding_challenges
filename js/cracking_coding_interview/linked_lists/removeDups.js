//doubly linked
function removeDup (head) {
  const seen = new Set();
  let currNode = head;
  while (currNode !== null) {
    if (seen.has(currNode.val)) {
      //remove node
      currNode.prev.next = currNode.next;
      currNode.next.prev = currNode.prev;
    } else {
      seen.add(currNode.val);
    }
    currNode = currNode.next;
  }
}

//singly linked
function removeDup2 (head) {
  const seen = new Set();
  let currNode = head;
  let prev = new Node(null);
  while (currNode !== null) {
    if (seen.has(currNode.val)) {
      prev.next = currNode.next;
    } else {
      seed.add(currNode.val);
      prev = currNode;
    }
    currNode = currNode.next;
  }
}

//no buffer allowed
function removeDup3 (head) {
  const currNode = head;
  while (currNode !== null) {
    let runner = current;
    while (runner.next !== null) {
      if (runner.next.val === currNode.val) {
        runner.next = runner.next.next;
      } else {
        runner = runner.next;
      }
    }
    currNode = currNode.next;
  }
}
