class DealOccurrence < ActiveRecord::Base
  belongs_to :deal, foreign_key: :schedulable_id

  default_scope { order('date ASC') }

  scope :remaining, lambda{where(["date >= ?",Time.now])} #generated by schedulable gem
  scope :previous, lambda{where(["date < ?",Time.now])} #generated by schedulable gem
  scope :on_date, -> (the_date){ includes(:deal).where(:date => the_date.midnight..the_date.end_of_day) }
  scope :today, -> { on_date(Date.current) }
  
end