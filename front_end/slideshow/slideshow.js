$(() => {
  let currIdx = 0;
  $("article").first().css("display", "block");
  $(".prev").on("click", goPrev);
  $(".next").on("click", goNext);

  function goPrev(e) {
    if (currIdx > 0) {
      $("article").eq(currIdx).css("display", "none");
      currIdx--;
      $("article").eq(currIdx).css("display", "block");
    }
  }

  function goNext(e) {
    const len = $("article").length;
    if (currIdx < len - 1) {
      $("article").eq(currIdx).css("display", "none");
      currIdx++;
      $("article").eq(currIdx).css("display", "block");
    }
  }
});
