function TempTracker() {
  this.max = null;
  this.min = null;

  this.sum = 0;
  this.n = 0;
  this.mean = null;

  this.occurrences = [];
  for (let i = 0; i < 110; i++) {
    this.occurrences[i] = 0;
  }
  this.maxOccurrences = 0;
  this.mode = null;
}

TempTracker.prototype.insert = function (temp) {
  this.max = Math.max(this.max, temp);
  this.min = Math.min(this.min, temp);

  this.sum += temp;
  this.n++;
  this.mean = this.sum / this.n;

  this.occurrences[temp]++;
  if (this.occurences[temp] > this.maxOccurrences) {
    this.mode = temp;
    this.maxOccurrences = this.occurences[temp];
  }
};

TempTracker.prototype.getMax = function () {
  return this.max;
};

TempTracker.prototype.getMin = function () {
  return this.min;
};

TempTracker.prototype.getMean = function () {
  return this.mean;
};

TempTracker.prototype.getMode = function () {
  return this.mode;
};
