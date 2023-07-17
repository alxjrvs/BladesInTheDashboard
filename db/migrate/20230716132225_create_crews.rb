class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.integer :reputation
      t.text :reputation_description
      t.integer :lair
      t.text :lair_description
      t.integer :hunting_ground
      t.text :hunting_ground_description
      t.integer :turf
      t.integer :hold
      t.integer :tier
      t.integer :heat
      t.integer :vaults
      t.integer :coin
      t.integer :wanted_level

      t.timestamps
    end
  end
end
