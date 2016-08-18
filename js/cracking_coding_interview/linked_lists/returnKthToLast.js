function returnKthToLast(head, k){
  let runner = head;
  let currNode = head;

  for (let i = 0; i < k; i++)
    if (runner === null) {
      return null;
    }
    runner = runner.next;
  }

  while (runner !== null) {
    runner = runner.next;
    currNode = currNode.next;
  }

  return currNode;
}
