class Deal < ActiveRecord::Base
  acts_as_schedulable

  belongs_to :venue
  has_one :schedule, as: :schedulable

end