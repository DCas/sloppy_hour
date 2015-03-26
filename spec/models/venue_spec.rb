require 'rails_helper'

describe Venue do
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }
  it { should validate_presence_of :name }
  it { should validate_presence_of :state }
  it { should validate_presence_of :street }
  it { should validate_presence_of :street_number }
  it { should validate_presence_of :zipcode }
  
  it { should have_many :deals }

# Class methods
  describe '.nearby(radius)' do
      it 'returns venues within given radius' do
        close_venue = create(:venue, :close)
        far_venue = create(:venue, :far)

        nearby_venues = Venue.nearby("Manchester, NH", 50)

        expect(nearby_venues).to include(close_venue)
        expect(nearby_venues).to_not include(far_venue)
      end
  end

  describe '.with_deals_on(date)'do
    pending
  end

# Instance methods
  describe '#address' do
    it 'returns a formatted address' do
      venue = create(:venue)

      expect(venue.address).to eq '88 Market Street, Manchester, NH 03101'
    end
  end

end