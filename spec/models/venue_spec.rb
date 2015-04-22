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
  describe '.with_deals_on(date)', :wip do
    it "returns only venues with deals on given date", :pending do
      date = Date.current
      venue = FactoryGirl.create(:venue_with_deals)
      venue.deal_occurrences.first.stub(:date){date}
      expect(venue.deal_occurrences.first.date).to eq date
    end
  end

# Instance methods
  describe '#address' do
    it 'returns a formatted address' do
      venue = create(:venue)

      expect(venue.address).to eq '88 Market Street, Manchester, NH 03101'
    end
  end

end
