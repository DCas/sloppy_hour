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
    @request.location.data
  end

end