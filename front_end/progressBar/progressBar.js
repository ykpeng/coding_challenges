$(() => {
  $(".start-button").on("click", startNewBar);
})

function doSetTimeout(newBar, percent) {
  if (percent > 100) {
    return startNewBar();
  }
  newBar.css("width", `${percent}%`);
  setTimeout(function(){
    percent++;
    doSetTimeout(newBar, percent);
  }, 100);
}

function startNewBar() {
  const newBar = $("<div>").addClass("bar");
  $(".bars").prepend(newBar);
  doSetTimeout(newBar, 1);
}
