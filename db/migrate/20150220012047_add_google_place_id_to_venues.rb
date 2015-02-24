class AddGooglePlaceIdToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :google_place_id, :string
  end
end
