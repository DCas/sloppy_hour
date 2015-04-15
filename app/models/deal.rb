class Deal < ActiveRecord::Base
  acts_as_schedulable occurrences: {name: :deal_occurrences, dependent: :destroy}

  belongs_to :venue

  validates :title, :venue, presence: true

  scope :occurring_on, -> (date){ joins(:deal_occurrences).merge(DealOccurrence.unscoped.on_date(date)) }

end