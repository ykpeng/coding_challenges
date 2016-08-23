// $(()=>{
// 	$(".vote").on("click", function(e){
// 		e.preventDefault();
// 		// let vote = $("input[radio]:checked").val();
//     // console.log($("input[radio]:checked"));
//     // console.log(vote);
//     let inputs = $(".choice");
// 		let bars = $(".bars").children();
//     // console.log(bars);
// 		// $(".bar1").css("width", "20px");
// 		for (let i = 0; i < bars.length; i++) {
//       console.log(inputs[i]);
//       if ($(bars[i]).attr("checked") === true) {
//         let width = parseInt($(bars[i]).css("width"));
//         $(bars[i]).css("width", (width + 10) + "px");
//       }
// 		}
// 	})
// })

$(()=>{
  $(".trump").on("click", function(){
    let width = parseInt($(".bar1").css("width"));
    $(".bar1").css("width", (width + 10) + "px");
  })
  $(".clinton").on("click", function(){
    let width = parseInt($(".bar2").css("width"));
    $(".bar2").css("width", (width + 10) + "px");
  })
})
