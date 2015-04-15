require 'rails_helper'

describe Deal do
  it { should validate_presence_of :title }
  it { should validate_presence_of :venue }

  it { should belong_to(:venue) }
  it { should have_one(:schedule) }

# Class methods
  describe '.occurring_on(date)' do
    pending
    it 'should return deals with occurrences on given date' do
    end
  end

  describe "Deal.filtered" do
    pending
    it "should filter Deals" do
    end
  end

# Instance methods
  describe "#destroy" do
    it "should destroy associated DealOccurrences" do
      pre_create_total_occurrences = DealOccurrence.count
      deal = FactoryGirl.create(:deal)
      pre_destroy_total_occurrences = DealOccurrence.count

      deal.destroy

      expect(DealOccurrence.count).to eq(pre_create_total_occurrences)
    end
  end

end