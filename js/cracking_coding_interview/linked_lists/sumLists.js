function sumLists (head1, head2, carry) {
  if (head1 === null && head2 === null && carry === 0) {
    return null;
  }

  let res = new Node();
  let value = carry;
  if (head1 !== null) {
    value += head1.val;
  }
  if (head2 !== null) {
    value += head2.val;
  }

  res.val = value % 10;
  carry = value / 10;

  if (head1 !== null || head2 !== null) {
    let more = sumLists(head1 === null ? null : head1.next, head2 === null? null : head2.next, carry);
    res.setNext(more);
  }
  return res;
}

// TODO: suppose the digits are stored in forward order
