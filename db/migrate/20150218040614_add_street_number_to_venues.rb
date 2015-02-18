class AddStreetNumberToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :street_number, :integer
  end
end
