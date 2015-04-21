Geocoder.configure(
  :google_places_details => {
  :api_key => ENV['GOOGLE_PLACES_API_KEY']
  },

  :ip_lookup => :freegeoip,

  :timeout => 5,
  :cache => Redis.new
)