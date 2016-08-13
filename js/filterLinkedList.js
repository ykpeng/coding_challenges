// Write a double-ended LinkedList class in JavaScript.
//
// You should have a Link class
// Write next and prev methods.
// You should write a remove method.
// You should write an insert method that inserts an item after the current link.
// You should have a LinkedList class
// It should have first and last methods to return the first/last links in the list.
// It should have push and pop methods.
// Given a linked list of integers and an integer value, delete every node of the linkedlist containing that value. Use JavaScript.

function Link(val){
  this.val = val;
  this.prev = null;
  this.next = null;
}

Link.prototype.next = function () {
  return this.next;
};

Link.prototype.prev = function () {
  return this.prev;
};

Link.prototype.remove = function () {
  this.prev.next = this.next;
  this.next.prev = this.prev;
};

Link.prototype.insert = function (link) {
  link.prev = this;
  link.next = this.next;
  this.next.prev = link;
  this.next = link;
};

function LinkedList(){
  this.head = new Link(null);
  this.tail = new Link(null);
  this.head.next = this.tail;
  this.tail.prev = this.head;
}

LinkedList.prototype.first = function () {
  if (this.head.next !== this.tail) {
    return this.head.next;
  } else {
    return null;
  }
};

LinkedList.prototype.last = function () {
  if (this.tail.prev !== this.head) {
    return this.tail.prev;
  } else {
    return null;
  }
};

LinkedList.prototype.push = function (link) {
  if (this.last()) {
    this.last().insert(link);
  } else {
    this.head.insert(link);
  }
};

LinkedList.prototype.pop = function () {
  if (this.last()) {
    const last = this.last();
    last.remove();
    return last;
  } else {
    return null;
  }
};

function deleteVal(linkedList, val){
  let currLink = linkedList.first();
  if (!currLink) {
    return;
  }
  while (currLink !== linkedList.tail) {
    if (currLink.val === val) {
      currLink.remove();
    }
    currLink = currLink.next;
  }
  return val;
}

const l1 = new Link(1);
const l2 = new Link(3);
const l3 = new Link(3);
const l4 = new Link(4);

const ll = new LinkedList();

ll.push(l1);
ll.push(l2);
ll.push(l3);
ll.push(l4);

let cl = ll.head;
while (cl !== ll.tail) {
  console.log(cl.val);
  cl = cl.next;
}

deleteVal(ll, 3);

let cl2 = ll.head;
while (cl2 !== ll.tail) {
  console.log(cl2.val);
  cl2 = cl2.next;
}
