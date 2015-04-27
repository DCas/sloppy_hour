require 'spec_helper'
require 'request_location_strategy'

describe 'RequestLocationStrategy' do

  context "request without location cookie", :wip do
  	it "uses ip location strategy" do
  		location = spy("location")
  		request = spy("request", :cookies => {}, :location => location)

  		RequestLocationStrategy.new(request)

  		expect(location).to have_received(:data)
  	end
  end

  context "request with location cookie", :wip do
  	it "uses ip location strategy" do
  		lat_lng = spy("lat_lng", :split => [42.9956397,-71.4547891])
  		request = spy("request", :cookies => {"lat_lng" => lat_lng })

  		RequestLocationStrategy.new(request)

  		expect(lat_lng).to have_received(:split)
  	end
  end

end