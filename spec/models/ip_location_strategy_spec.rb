require 'spec_helper'
require 'ip_location_strategy'

describe 'IPLocationStrategy' do

  context 'Request has no location' do
	  describe '#coordinates' do
	    it "returns array with default GPS coordinates" do
	    	request = double("request", :location => nil)
	      strategy = IPLocationStrategy.new(request)

	      coordinates = strategy.coordinates
	      
	      expect(coordinates).to eq [42.9956397, -71.4547891]
	    end
	  end
	end

  context 'Request has location' do
	  describe '#coordinates' do
	    it "returns array with GPS coordinates for request IP" do
	    	location_data = {"latitude" => 35.109, 'longitude' => -106.581}
	    	location = double(:data => location_data)
	    	request = double("request", :location => location)
	      strategy = IPLocationStrategy.new(request)

	      coordinates = strategy.coordinates
	      
	      expect(coordinates).to eq location_data.values
	    end
	  end
	end

end