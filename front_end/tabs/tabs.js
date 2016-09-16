$(() => {
  $(".tab").on("click", showTab);
});

function showTab(e){
  let idx = $(".tab").index($(e.target));
  $("article").each((i, el) => {
    if (i === idx) {
      $(el).css("display", "block");
    } else {
      $(el).css("display", "none");
    }
  });
}
