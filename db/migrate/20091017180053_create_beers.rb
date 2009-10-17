class CreateBeers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :beers
  end
end
