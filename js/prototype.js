Function.prototype.inherits = function (BaseClass) {
  function Surrogate () {};
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function Cat (name) {
  this.name = name;
}

Cat.prototype.meow = function () {
  console.log(this.name + " meows!");
};

function Tabby (name) {
  Cat.call(this, name);
}

Tabby.inherits(Cat);

Tabby.prototype.scratch = function () {
  console.log(this.name + " scratches!");
};

const clara = new Tabby("Clara");
clara.meow();
clara.scratch();
