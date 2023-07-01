# frozen_string_literal: true

class AddActionsToPlayerCharacter < ActiveRecord::Migration[7.0]
  def change
    change_table :player_characters do |t|
      t.integer :hunt, default: 0
      t.integer :study, default: 0
      t.integer :survey, default: 0
      t.integer :tinker, default: 0
      t.integer :finesse, default: 0
      t.integer :prowl, default: 0
      t.integer :wreck, default: 0
      t.integer :attune, default: 0
      t.integer :command, default: 0
      t.integer :consort, default: 0
      t.integer :sway, default: 0
    end
  end
end
