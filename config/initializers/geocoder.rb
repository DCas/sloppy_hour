Geocoder.configure(

  :yandex => {
    :api_key => "...",
    :timeout => 5
  },

  :baidu => {
    :api_key => "..."
  },

  :maxmind => {
    :api_key => "...",
    :service => :omni
  },

  :google_places_details => {
  :api_key => ENV['GOOGLE_PLACES_API_KEY']
  }
  
)