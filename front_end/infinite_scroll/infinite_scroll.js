$(document).ready(function() {
	const win = $(window);

	// Each time the user scrolls
	win.scroll(function() {
		// End of the document reached?
		if ($(document).height() - win.height() === win.scrollTop()) {

			$.ajax({
				url: 'posts',
        method: 'GET',
				dataType: 'html',
				success: function(html) {
					$('.posts').append(html);
				}
			});
		}
	});
});
