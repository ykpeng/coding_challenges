$(()=>{
  const rootEl = $(".game");
  const game = new LightsOut(rootEl, 5);
  game.start();
})

function LightsOut(rootEl, dim) {
  this.rootEl = rootEl;
  this.dim = dim;
  this.setUpGrid();
}

LightsOut.DIRS = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1]
]

LightsOut.prototype.setUpGrid = function() {
  const grid = $("<ul>");
  for (let i = 0; i < this.dim; i++) {
    let row = $("<ul>");
    for (let j = 0; j < this.dim; j++) {
      row.append($("<li>"));
    }
    grid.append(row);
  }
  this.rootEl.append(grid);
}

LightsOut.prototype.start = function () {
  let self = this;
  $("li").on("click", function(e){
    $(this).toggleClass("on");

    let idx = $("li").index($(this));
    let row = Math.floor(idx / self.dim);
    let col = idx % self.dim;

    LightsOut.DIRS.forEach((dir)=>{
      let x = row + dir[0];
      let y = col + dir[1];

      if (x >= 0 && x < self.dim && y >= 0 && y < self.dim) {
        let adjIdx = x * self.dim + y;
        let adj = $("li").eq(adjIdx);
        adj.toggleClass("on");
      }
    })
  });
};
