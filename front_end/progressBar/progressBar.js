$(() => {
  $(".start-button").on("click", startNewBar);
  $(".start-button2").on("click", startNewBar2);
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

function startNewBar2() {
  const newBar = $("<div>").addClass("bar");
  $(".bars").prepend(newBar);
  width = 0;
  const intervalId = setInterval(frame, 100);

  function frame(){
    if (width === 100) {
      clearInterval(intervalId);
      startNewBar2();
    } else {
      width++;
      newBar.css("width", `${width}%`);
      newBar.text(`${width}%`);
    }
  }
}
