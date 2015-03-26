class CreateDealOccurrences < ActiveRecord::Migration
  def self.up
    create_table :deal_occurrences do |t|

      t.references :schedulable, polymorphic: true
      t.datetime :date

      t.timestamps
      
    end
  end

  def self.down
    drop_table :deal_occurrences
  end
end