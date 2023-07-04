# frozen_string_literal: true

class CreateTraumas < ActiveRecord::Migration[7.0]
  def change
    create_table :traumas do |t|
      t.belongs_to :player_character, null: false, foreign_key: true
      t.integer :trauma, default: Trauma.traumas[:unset]

      t.timestamps
    end
  end
end
