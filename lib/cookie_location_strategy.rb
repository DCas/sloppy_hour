require 'null_location_strategy'
require 'geocoder'

class CookieLocationStrategy
  attr :data

  def initialize(request)
    @request = request
    @data = location_data
  end

  def coordinates
    @request.cookies["lat_lng"].split("|").map { |s| s.to_f }
  end

  private

  def location_data
    l = Geocoder.search(coordinates).first
    {
      "latitude" => l.latitude,
      "longitude" => l.longitude,
      "city" => l.city,
      "state" => l.state
    }
  end

end