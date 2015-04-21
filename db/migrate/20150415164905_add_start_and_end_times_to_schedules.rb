class AddStartAndEndTimesToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :start_time, :Time
    add_column :schedules, :end_time, :Time
  end
end
