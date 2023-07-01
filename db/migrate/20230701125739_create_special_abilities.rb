# frozen_string_literal: true

class CreateSpecialAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :special_abilities do |t|
      t.string :name
      t.text :description
      t.integer :cost, default: 0
      t.integer :points, default: 0
      t.string :detail
      t.belongs_to :player_character, null: false, foreign_key: true
      t.integer :playbook_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
