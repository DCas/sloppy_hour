require 'null_location_strategy'

class IPLocationStrategy
  def initialize(request)
    @request = request
  end

  def coordinates
    if !(location = @request.location)
      NullLocationStrategy.new.coordinates
    else
      location.coordinates
    end
  end

end