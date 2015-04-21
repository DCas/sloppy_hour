var Deals = {

	'init': function() {
		this.container = $('#deals');

		this.container.isotope({
		  itemSelector: '.deal',
		  layoutMode: 'vertical'
		});

		$('.item-types').on( 'click', 'input[type=checkbox]', Deals.filter);
	},

	'filter': function() {
		var filters = [];

		$('.item-types input[type=checkbox]:checked').each(function() {
			filters.push('.' + $(this).attr('value'));
		});

		var filterValue = filters.join(', ');
		$('#deals').isotope({ filter: filterValue });
	}
	
}

$(document).ready( function(){
	Deals.init();	
})