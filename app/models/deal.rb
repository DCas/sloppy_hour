class Deal < ActiveRecord::Base
  acts_as_schedulable occurrences: :deal_occurrences

  belongs_to :venue
  has_one :schedule, as: :schedulable

  validates :title, :venue, presence: true

  scope :occurring_on, -> (date){ joins(:deal_occurrences).merge(DealOccurrence.unscoped.on_date(date)) }

end