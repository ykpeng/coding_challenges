function intersection (head1, head2) {
  if (head1 === null || head2 === null) {
    return null;
  }

  tail1, length1 = getTailAndSize(head1);
  tail2, length2 = getTailAndSize(head1);

  if (tail1 !== tail2) {
    return null;
  }

  let shorter = length1 > length2 ? head1 : head2;
  let longer = length1 > length2 ? head2 : head1;

  longer = getKthNode(Math.abs(length1 - length2));

  while (shorter !== longer) {
    shorter = shorter.next;
    longer = longer.next;
  }

  return shorter;
}

function getTailAndSize(head) {
  if (head === null) {
    return [null, 0];
  }
  let currNode = head;
  let length = 1;
  while (currNode.next !== null) {
    length++;
    currNode = currNode.next;
  }
  return [tail, length]
}

function getKthNode(head, k) {
  let cnt = 1;
  let currNode = head;
  while (cnt < k && currNode !== null) {
    currNode = currNode.next;
    cnt++;
  }
  return currNode;
}
