class Deal < ActiveRecord::Base
  acts_as_schedulable occurrences: :deal_occurrences
  acts_as_taggable
  acts_as_taggable_on :item_types
  belongs_to :venue

  validates :title, :venue, presence: true

  scope :occurring_on, -> (date){ joins(:deal_occurrences).merge(DealOccurrence.unscoped.on_date(date)) }

end