# frozen_string_literal: true

class CreatePlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :player_characters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.integer :playbook_id, foreign_key: true, null: false
      t.boolean :retired, default: false
      t.string :name
      t.string :nickname
      t.text :look
      t.integer :heritage
      t.text :heritage_description
      t.integer :background
      t.text :background_description
      t.integer :vice
      t.text :vice_description
      t.integer :stress, default: 0
      t.boolean :armor, default: false
      t.boolean :heavy, default: false
      t.boolean :special, default: false
      t.integer :playbook_xp, default: 0
      t.integer :insight_xp, default: 0
      t.integer :prowess_xp, default: 0
      t.integer :resolve_xp, default: 0
      t.integer :coin, default: 0
      t.integer :stash, default: 0
      t.integer :load, default: PlayerCharacter.loads[:normal]
      t.integer :hunt, default: 0
      t.integer :study, default: 0
      t.integer :survey, default: 0
      t.integer :tinker, default: 0
      t.integer :finesse, default: 0
      t.integer :prowl, default: 0
      t.integer :skirmish, default: 0
      t.integer :wreck, default: 0
      t.integer :attune, default: 0
      t.integer :command, default: 0
      t.integer :consort, default: 0
      t.integer :sway, default: 0

      t.timestamps
    end
  end
end
