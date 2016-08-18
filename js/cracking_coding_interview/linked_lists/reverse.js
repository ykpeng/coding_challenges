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
  if (this.next !== null) {
    this.next.prev = link;
  }
  this.next = link;
};


const l1 = new Link(1);
const l2 = new Link(2);
const l3 = new Link(3);
const l4 = new Link(4);

l1.insert(l2);
l2.insert(l3);
l3.insert(l4)

//doubly linked
function reverse2(node){
  let prev = null;
  let curr = node;
  while (curr !== null) {
    let next = curr.next;
    curr.next = curr.prev;
    curr.prev = next;
    prev = curr;
    curr = next;
  }
  return prev;
}

let cl = l1;
while (cl !== null) {
  console.log(cl.val);
  cl = cl.next;
}

let cl2 = reverse2(l1);
while (cl2 !== null) {
  console.log(cl2.val);
  cl2 = cl2.next;
}

//singly linked
function reverse(node) {
  let prev = null;
  let curr = node;
  while (curr !== null) {
    let next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }
  return prev;
}
