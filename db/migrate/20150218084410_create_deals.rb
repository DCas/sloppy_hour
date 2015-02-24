class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.references :venue, index: true

      t.timestamps null: false
    end
    add_foreign_key :deals, :venues
  end
end
