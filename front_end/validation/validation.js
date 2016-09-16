$(()=>{
  $("input").on("input", showMessage);
});

function showMessage(e){
	let value = $(e.target).val();
  let $messageTd = $(e.target).parent().next();

  if (value.length > 0) {
    if (value.length < 3) {
      $messageTd.addClass("error")
      $messageTd.text("Less than 3 characters");
    } else {
      $messageTd.addClass("success")
      $messageTd.text("All good");
    }

    $("input").each((idx, el) => {
      if (el !== e.target && $(el).val() === $(e.target).val()) {
        $messageTd.removeClass();
        $messageTd.addClass("error");
        $messageTd.text("No duplicates allowed");
      }
    })

  } else {
    $messageTd.text("");
  }
};
