# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :cost, default: 1
      t.integer :points, default: 0
      t.boolean :intrinsic, default: false
      t.belongs_to :player_character, null: false, foreign_key: true
      t.boolean :default, default: false
      t.integer :playbook_id, foreign_key: true

      t.timestamps
    end
  end
end
