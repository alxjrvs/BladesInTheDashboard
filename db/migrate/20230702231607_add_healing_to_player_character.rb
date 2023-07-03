# frozen_string_literal: true

class AddHealingToPlayerCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :player_characters, :healing_clock, :integer, default: 0
  end
end
