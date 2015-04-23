class Deal < ActiveRecord::Base
  include Comparable
  acts_as_schedulable occurrences: {name: :deal_occurrences, dependent: :destroy}
  acts_as_taggable
  acts_as_taggable_on :item_types
  belongs_to :venue

  validates :title, :venue, presence: true

  scope :occurring_on, -> (date){ joins(:deal_occurrences).merge(DealOccurrence.unscoped.on_date(date)) }
  scope :with_tags, -> (tags){ tagged_with(tags, on: :item_types, any: true) }
  
  delegate :start_time, :end_time, to: :schedule

  DEAL_TYPES = ["beer", "food", "liquor", "cocktails", "shots"]

  def self.filtered(params)
    
    filter.restrict(params)

  end

  def <=>(another)
    earliest = DateTime.new
    (schedule.end_time || earliest) <=> (another.schedule.end_time || earliest)
  end

  private

  def self.filter
    @filter = DealFilter.new(Deal.all)
  end

end
