$('document').ready(function() {
	getGeoLocation();
	$('input#venue_name').geocomplete({details: 'form', detailsAttribute: 'data-geo', types: ["establishment"]});
})

function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}