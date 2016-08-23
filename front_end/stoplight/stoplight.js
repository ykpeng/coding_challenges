$(()=>{
  greenOn(yellowOn);
})

function greenOn(yellowOn) {
	//light green up, dim others
	$(".green").css("background", "green");
	$(".red").css("background", "grey");
	return setTimeout(function(){yellowOn(redOn);}, 1000);
}

function yellowOn(redOn) {
	//light yellow up, dim others
	$(".yellow").css("background", "yellow");
	$(".green").css("background", "grey");
	return setTimeout(function(){redOn(greenOn);}, 1000);
}

function redOn(greenOn) {
	//light yellow up, dim others
	$(".red").css("background", "red");
	$(".yellow").css("background", "grey");
	return setTimeout(function(){greenOn(yellowOn);}, 1000);
}
