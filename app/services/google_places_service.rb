class GooglePlacesService
  cattr_reader :google_places_client, instance_accessor: false do
    GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
  end

  def self.nearby_venues(lat, long, options = {})
    search_params = {types: 'restaurant|bar', radius: 50000}
    google_places_client.spots(lat, long, search_params.merge(options))
  end

  def self.venue_details(place_id)
    google_places_client.spot(place_id)
  end
end 