$('document').ready(function() {
	$('input#venue_name').geocomplete({details: 'form', detailsAttribute: 'data-geo', types: ["establishment"]});
})