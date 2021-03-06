require 'ip_location_strategy'
require 'cookie_location_strategy'

class RequestLocationStrategy
  attr :data

  def initialize(request)
    @request = request
    @data = location_data
  end

  def coordinates
    [data['latitude'], data['longitude']]
  end

  private

  def location_data
    if @request.cookies["lat_lng"]
      CookieLocationStrategy.new(@request).data
    elsif @request.location
      IPLocationStrategy.new(@request).data
    end
  end

end