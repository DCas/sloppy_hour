require 'rails_helper'

describe Deal do
  it { should validate_presence_of :title }
  it { should validate_presence_of :venue }

  it { should belong_to(:venue) }
  it { should have_one(:schedule) }

  describe "#next_occurrence" do
    it "should return next occurrence" do
      deal = FactoryGirl.build(:deal)

      expect(deal.next_occurrence).to be_a(IceCube::Occurrence) 
    end
  end


end