class Deal < ActiveRecord::Base
  acts_as_schedulable occurrences: {name: :deal_occurrences, dependent: :destroy}
  acts_as_taggable
  acts_as_taggable_on :item_types
  belongs_to :venue

  validates :title, :venue, presence: true

  scope :occurring_on, -> (date){ joins(:deal_occurrences).merge(DealOccurrence.unscoped.on_date(date)) }

  def self.filtered(params)
    filter.restrict(params)
  end

  private

  def self.filter
    @@filter = DealFilter.new(Deal.all)
  end

end