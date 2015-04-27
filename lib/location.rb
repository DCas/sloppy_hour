require 'null_location_strategy'

class Location

	def self.data_whitelist
		[:latitude, :longitude, :city, :state]
	end

	data_whitelist.each do |attribute|
		define_method(attribute) do
			@data[attribute]
		end
	end

	def initialize(location_strategy = NullLocationStrategy.new)
		@location_strategy = location_strategy
		begin
			@data = filter_data(@location_strategy.data)
		rescue
			@data = filter_data(NullLocationStrategy.new.data)
		end
	end

	def coordinates
		[latitude, longitude]
	end

	private

	def filter_data(data)
		h = {}
		data.keys.map {|k| h[k.to_sym] = data[k] if Location.data_whitelist.include?(k.to_sym)}; h
	end

end