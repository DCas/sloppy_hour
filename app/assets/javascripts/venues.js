$(document).ready(function() {
	$('.venues li').on('click', function() {
		$(this).children('.venue-deals').toggle();
	});
})
