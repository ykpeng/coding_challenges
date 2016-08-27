const Heap = require('heap');

function StreamMedian() {
  this.minHeap = new Heap();
  this.maxHeap = new Heap((a, b) => {
    return b - a;
  });
  this.n = 0;
}

StreamMedian.prototype.insert = function (num) {
  if (this.n % 2 === 0) {
    this.maxHeap.push(num);
    this.n++;
    if (this.minHeap.size === 0) {
      return;
    }
    if (this.maxHeap.peek() > this.minHeap.peek()) {
      let toMin = this.maxHeap.pop();
      let toMax = this.minHeap.pop();
      this.minHeap.push(toMin);
      this.maxHeap.push(toMax);
    }
  } else {
    this.maxHeap.push(num);
    let toMin = this.maxHeap.pop();
    this.minHeap.push(toMin);
    this.n++
  }
}

StreamMedian.prototype.getMedian = function () {
  if (this.n % 2 === 0) {
    return ((this.maxHeap.peek() + this.minHeap.peek()) / 2);
  } else {
    return this.maxHeap.peek();
  }
};

const m = new StreamMedian();
m.insert(4);
console.log(m.getMedian());
m.insert(7);
console.log(m.getMedian());
m.insert(8);
console.log(m.getMedian());
m.insert(9);
console.log(m.getMedian());
m.insert(0);
console.log(m.getMedian());
