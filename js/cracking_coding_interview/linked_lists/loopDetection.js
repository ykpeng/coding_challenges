function loopDetection (head) {
  let fast = head;
  let slow = head;

  while (fast.next !== null && slow.next !== null) {
    slow = slow.next;
    fast = fast.next.next;
    if (slow === fast) {
      break;
    }
  }

  if (fast === null || slow === null) {
    return null;
  }

  slow = head;

  while (slow !== fast) {
    slow = slow.next;
    fast = fast.next;
  }

  return slow; 
}
