# frozen_string_literal: true

class CreatePlaybooks < ActiveRecord::Migration[7.0]
  def change
    create_table :playbooks do |t|
      t.belongs_to :player_character, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.jsonb :items
      t.jsonb :contacts
      t.jsonb :special_abilities

      t.timestamps
    end
  end
end
