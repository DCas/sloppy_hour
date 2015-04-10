require 'rails_helper'

describe Deal do
  it { should validate_presence_of :title }
  it { should validate_presence_of :venue }

  it { should belong_to(:venue) }
  it { should have_one(:schedule) }

end