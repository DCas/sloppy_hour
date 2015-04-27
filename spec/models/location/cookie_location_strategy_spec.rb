require 'spec_helper'
require 'cookie_location_strategy'

describe 'CookieLocationStrategy' do

  describe '#coordinates' do
    it "returns array with GPS coordinates for request IP" do
		location_data = [43.0288068, -71.45293199999999]
		request = double("request", :cookies => {"lat_lng" => location_data.join("|")})
		strategy = CookieLocationStrategy.new(request)

		coordinates = strategy.coordinates
      
		expect(coordinates).to eq location_data
    end
  end

end