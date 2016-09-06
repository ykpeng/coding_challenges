// function addTwoNumbers (head1, head2) {
//   let curr1 = head1;
//   let curr2 = head2;
//
//   let remainder;
//   let carry = 0;
//   let newHead = new ListNode();
//   let prevLink = newHead;
//
//   while (curr1 && curr2) {
//     let sum = curr1.val + curr2.val + carry;
//     remainder = sum % 10;
//     carry = sum / 10;
//     let link = new ListNode (remainder);
//     if (prevLink) {
//       prevLink.next = link;
//     }
//     prevLink = link;
//
//     curr1 = curr1.next;
//     curr2 = curr2.next;
//   }
//
//   while (curr1) {
//     let sum = curr1.val + carry;
//     remainder = sum % 10;
//     carry = sum / 10;
//     let link = new ListNode(remainder);
//     if (prevLink) {
//       prevLink.next = link;
//     }
//     prevLink = link;
//
//     curr1 = curr1.next;
//   }
//
//   while (curr2) {
//     let sum = curr2.val + carry;
//     remainder = sum % 10;
//     carry = sum / 10;
//     let link = new ListNode(remainder);
//     if (prevLink) {
//       prevLink.next = link;
//     }
//     prevLink = link;
//
//     curr2 = curr2.next;
//   }
//
//   return newHead;
// }

function ListNode (val) {
  this.val = val;
  this.next = null;
}

function addTwoNumbers (node1, node2, carry = 0) {
  if (!node1 && !node2 && carry === 0) {
    return null;
  }

  let val = carry;
  if (node1) {
    val += node1.val;
  }

  if (node2) {
    val += node2.val;
  }

  carry = Math.floor(val / 10);
  let newNode = new ListNode(val % 10);

  if (node1 || node2) {
    newNode.next = addTwoNumbers(node1 === null ? null : node1.next, node2 === null? null : node2.next, carry);
  }

  return newNode;
}
