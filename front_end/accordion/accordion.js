$(() => {
  $(".heading").on("click", expandArticle);
});

function expandArticle(e){
  $(e.target).next().toggle();
}
