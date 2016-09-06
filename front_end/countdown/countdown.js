document.addEventListener("DOMContentLoaded", function(){
  const timer = new Timer();
})

function Timer(){
  const diff = new Date(2017, 0, 1) - new Date();

  this.hrs = Math.floor(diff / (1000 * 60 * 60));
  let millisRemaining = diff % (1000 * 60 * 60);

  this.mins = Math.floor(millisRemaining / (1000 * 60));
  millisRemaining = Math.floor(millisRemaining % (1000 * 60));

  this.secs = Math.floor(millisRemaining / 1000);

  let intervalId = setInterval(this._tick.bind(this), 1000);
}

Timer.prototype._tick = function () {
  this._decrementSecs();

  if (this.hrs === 0 && this.mins === 0 && this.secs === 0) {
    document.getElementById("countdown").textContent = "HAPPY NEW YEAR";
    clearInterval(intervalId);
  } else {
    document.getElementById("hrs").textContent = this.hrs;
    document.getElementById("mins").textContent = this.mins;
    document.getElementById("secs").textContent = this.secs;
  }
};

Timer.prototype._decrementSecs = function () {
  this.secs--;
  if (this.secs < 0) {
    this.secs = 59;
    this._decrementMins();
  }
};

Timer.prototype._decrementMins = function () {
  if (this.hrs > 0 || this.mins > 0) {
    this.mins--;
  }
  if (this.mins < 0) {
    this.mins = 59;
    this._decrementHrs();
  }
};

Timer.prototype._decrementHrs = function () {
  if (this.hrs > 0) {
    this.hrs--;
  }
};
