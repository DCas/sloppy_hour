this.SloppyHour.CurrentLocation = (function() {

	this.SloppyHour.CurrentLocation.DEFAULT_LOCATION = 'Manchester, NH';

	this.SloppyHour.CurrentLocation.getGeoLocation = function() {
  		return(navigator.geolocation.getCurrentPosition(SloppyHour.CurrentLocation.setGeoCookie));
	}

	this.SloppyHour.CurrentLocation.setGeoCookie = function(position) {
  		var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  		document.cookie = "lat_lng=" + escape(cookie_val);
	}
	return SloppyHour.CurrentLocation;
})();