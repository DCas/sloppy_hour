class Schedule < ActiveRecord::Base
  include Schedulable::ScheduleSupport
  
  serialize :days
  serialize :day_of_week, Hash
  
  belongs_to :schedulable, polymorphic: true
  
  after_initialize :init_schedule
  after_save :init_schedule

  # after_initialize :check_overnight

  # def check_overnight
  #   if start_time > end_time
  #     end_time = end_time + 1.day
  #   end
  # end

end
