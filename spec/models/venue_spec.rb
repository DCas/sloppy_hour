require 'rails_helper'

describe Venue  do

  before(:suite) do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "Manchester, NH", [
        {
          'latitude'     => 42.9956397,
          'longitude'    => -71.4547891,
          'address'      => 'Manchester',
          'state'        => 'New Hampshire',
          'state_code'   => 'NH',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )
  end

  describe '.nearby' do
    context 'with location parameter' do
      it 'returns venues within 10 miles of location' do
        close_venue = FactoryGirl.create(:venue)
        close_venue.geocode
        nearby_venues = Venue.nearby("Manchester, NH", 50)
        expect(nearby_venues).to include(close_venue)
      end
    end
  end

  describe '#address' do
    it 'returns a formatted address' do
      venue = FactoryGirl.create(:venue)
      expect(venue.address).to eq '88 Market Street, Manchester, NH 03101'
    end
  end

end