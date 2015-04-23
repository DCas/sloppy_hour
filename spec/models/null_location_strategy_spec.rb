require 'spec_helper'
require 'null_location_strategy'

describe 'NullLocationStrategy' do

  describe '#coordinates' do
    it "should return array with default GPS coordiantes" do
      strategy = NullLocationStrategy.new

      coordinates = strategy.coordinates
      
      expect(coordinates).to eq [42.9956397, -71.4547891]
    end
  end

end
