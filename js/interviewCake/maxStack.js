function MaxStack(){
  this.stack = new Stack();
  this.max = new Stack();
}

MaxStack.prototype.getMax = function () {
  return this.max.peek();
};

MaxStack.prototype.push = function (el) {
  this.stack.push(el);
  if (!this.max.peek() || el > this.max.peek()) {
    this.max.push(el);
  } else {
    this.max.push(this.max.peek());
  }
  return el;
};

MaxStack.prototype.pop = function () {
  let el = this.stack.pop();
  this.max.pop();
  return el;
};

function Stack() {
  // initialize an empty array
  this.items = [];
}

// push a new item to the last index
Stack.prototype.push = function(item) {
  this.items.push(item);
};

// remove the last item
Stack.prototype.pop = function() {

  // if the stack is empty, return null
  // (it would also be reasonable to throw an exception)
  if (!this.items.length) return null;

  return this.items.pop();
};

// see what the last item is
Stack.prototype.peek = function() {
  if (!this.items.length) return null;
  return this.items[this.items.length -1];
};
