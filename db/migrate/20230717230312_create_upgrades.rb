class CreateUpgrades < ActiveRecord::Migration[7.0]
  def change
    create_table :upgrades do |t|
      t.belongs_to :crew, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :cost, default: 1
      t.integer :points, default: 0
      t.integer :order, null: false
      t.integer :playbook_id, foreign_key: true

      t.timestamps
    end
  end
end
