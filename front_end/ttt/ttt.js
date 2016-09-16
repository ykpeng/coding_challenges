$(() => {
  const $rootEl = $("#ttt");
  // const game = new Game();
  new View($rootEl);
});

function View($rootEl){
  // this.game = game;
  this.$rootEl = $rootEl;

  this.setUpBoard();
  this.bindEvents();
  this.currentPlayer = "x";
}

View.prototype.bindEvents = function () {
  this.$rootEl.on("click", "li", this.makeMove.bind(View));
};

View.prototype.setUpBoard = function () {
  const board = $("<ul>").addClass("board");
  for (let i = 0; i < 3; i++) {
    let row = $("<ul>").addClass("row");
    for (let j = 0; j < 3; j++) {
      row.append($("<li>").addClass("square"));
    }
    board.append(row);
  }
  this.$rootEl.append(board);
};

View.prototype.makeMove = function (e) {
  $(e.target).text(this.currentPlayer)
  if (this.winner()) {
    alert(`${this.currentPlayer} won!`);
    this.$rootEl.off();
    return;
  }
  if (this.currentPlayer === "x") {
    this.currentPlayer = "o";
  } else {
    this.currentPlayer = "x";
  }
};

View.prototype.winner = function () {
  const winner = this.winnerHelper()
  if (winner) {
    return winner;
  }

  return null;
};

View.prototype.winnerHelper = function () {
  $(".row").each((i, ul) => {
    let winner = true;
    $(ul).children().each((j, li) => {
      if ($(li).text() !== this.currentPlayer) {
        winner = false;
      }
    })
    if (winner) {
      return this.currentPlayer;
    }
  })

  return null;
};

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => {
    this.call(ctx, ...bindArgs, ...callArgs);
  }
};
