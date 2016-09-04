function LRUCache (capacity) {
  this.map = new HashMap();
  this.store = new LinkedList();
  this.capacity = capacity;
}

LRUCache.prototype.count = function () {
  this.map.length;
};

LRUCache.prototype.get = function (key) {
  if (this.map.includes(key)) {
    let link = this.map.get(key);
    this.updateLink(link);
    return link.value;
  } else {
    return null;
  }
};

LRUCache.prototype.set = function (key, value) {
  if (this.map.includes(key)) {
    this.store.remove(key);
    this.store.insert(key, value);
  } else {
    if (this.count() === this.capacity) {
      this.eject();
    }
    let link = this.store.insert(key, value);
    this.map.set(key, link);
  }
};

LRUCache.prototype.updateLink = function (link) {
  this.store.remove(link.key);
  this.store.insert(link.key, link.value);
};

LRUCache.prototype.eject = function () {
  let key = this.store.first().key;
  this.store.remove(key);
  this.map.delete(key);
};

function HashMap (numBuckets = 8) {
  this.store = new Array(numBuckets).fill(new LinkedList());
  this.count = 0;
}

HashMap.prototype.includes = function (key) {
  return this.bucket(key).includes(key);
};

HashMap.prototype.set = function (key, value) {
  if (this.includes(key)) {
    this.delete(key);
  }
  if (this.count === this.numBuckets()) {
    this.resize();
  }
  this.bucket(key).insert(key, value);
  this.count++;
};

HashMap.prototype.delete = function (key) {
  let link = this.bucket(key).remove(key);
  if (link) {
    this.count--;
  }
  return link;
};

HashMap.prototype.resize = function () {
  let newLength = numBuckets * 2
  let newStore = new Array(newLength).fill(new LinkedList());

  this.store.forEach(bucket => {
    let currLink = bucket.head.next;
    while (currLink !== bucket.tail) {
      newStore[currLink.key % newLength].insert(currLink.key, currLink.value);
      currLink = currLink.next;
    }
  })

  this.store = newStore;
};

HashMap.prototype.numBuckets = function () {
  this.store.length;
};

HashMap.prototype.bucket = function (key) {
  return this.store[key % this.numBuckets()];
};

function Link (key = null, value = null) {
  this.key = key;
  this.value = value;
  this.prev = null;
  this.next = null;
}

function LinkedList() {
  this.head = new Link();
  this.tail = new Link();
  this.head.next = this.tail;
  this.tail.prev = this.head;
}

LinkedList.prototype.empty = function () {
  return this.head.next === this.tail;
};

LinkedList.prototype.first = function () {
  if (empty) {
    return null;
  } else {
    return this.head.next;
  }
};

LinkedList.prototype.last = function () {
  if (empty) {
    return null;
  } else {
    return this.tail.prev;
  }
};

LinkedList.prototype.get = function (key) {
  let currLink = this.head.next;
  while (currLink !== this.tail) {
    if (currLink.key === key) {
      return currLink.value;
    }
    currLink = currLink.next;
  }
  return null;
};

LinkedList.prototype.insert = function (key, value) {
  let currLink = this.head.next;
  while (currLink !== this.tail) {
    if (currLink.key === key) {
      currLink.value = value;
      return currLink;
    }
    currLink = currLink.next;
  }

  let newLink = new Link(key, value);
  newLink.prev.next = newLink;
  newLink.next = this.tail;
  newLink.prev = this.tail.prev;
  this.tail.prev = newLink;

  return newLink;
};

LinkedList.prototype.remove = function (key) {
  let currLink = this.head.next;
  while (currLink !== this.tail) {
    if (currLink.key === key) {
      currLink.prev.next = currLink.next;
      currLink.next.prev = currlink.prev;
      currLink.next = null;
      currLink.prev = null;
      return currLink;
    }
    currLink = currLink.next;
  }
  return null;
};
