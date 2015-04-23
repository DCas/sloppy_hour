require 'null_location_strategy'

class IPLocationStrategy
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
    if !(location = @request.location)
      NullLocationStrategy.new.data
    else
      location.data
    end
  end

end