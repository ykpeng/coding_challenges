function StackQueue(){
  this.inStack = [];
  this.outStack = [];
}

StackQueue.prototype.enqueue = function (el) {
  this.inStack.push(el)
};

StackQueue.prototype.dequeue = function () {
  if (this.outStack.length === 0) {
    for (var i = 0; i < this.inStack.length; i++) {
      this.outStack.push(this.inStack.pop());
    }
  }
  this.outStack.pop();
};
