require 'null_location_strategy'
require 'ip_location_strategy'

class Location
	def initialize(location_strategy = NullLocationStrategy.new)
    	@location_strategy = location_strategy
		@data = @location_strategy.data
	end

	def coordinates
    	@location_strategy.coordinates
	end

	def city
		@data["city"]
	end
end