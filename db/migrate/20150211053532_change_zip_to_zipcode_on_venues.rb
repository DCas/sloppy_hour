class ChangeZipToZipcodeOnVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :zip, :integer
    add_column :venues, :zipcode, :string
  end
end
