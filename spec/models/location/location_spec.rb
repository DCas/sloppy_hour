require 'spec_helper'
require 'location'

describe Location do
	it { should respond_to :latitude, :longitude, :city, :state }
	
	describe "#coordinates" do
		it "returns array with GPS coordinates" do
			location = Location.new

			coordinates = location.coordinates

			expect(coordinates).to be_a Array
			expect(coordinates.length).to eq 2
			coordinates.each { |e| expect(e).to_not be_nil }
		end
	end

end