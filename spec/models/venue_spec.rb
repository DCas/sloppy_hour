require 'rails_helper'

describe Venue do

  describe '.nearby' do
    context 'with location parameter' do
      it 'returns venues within 10 miles of location' do
        pending
        close_venue = create(:venue)
        close_venue.geocode
        nearby_venues = Venue.nearby("Manchester, NH", 50)
        expect(nearby_venues).to include(close_venue)
      end
    end
  end

  describe '.with_deals_on' do
    context 'with date parameter' do
      it 'returns venues with deals on the given date' do
        date = Date.current
        venue = create(:venue)

        result = Venue.with_deals_on(date)

        expect(result).to_not include(venue)
      end
    end
  end

  describe '#address' do
    it 'returns a formatted address' do
      venue = create(:venue)
      expect(venue.address).to eq '88 Market Street, Manchester, NH 03101'
    end
  end

end