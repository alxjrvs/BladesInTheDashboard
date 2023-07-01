class CreatePlayerCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :player_characters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.boolean :retired, default: false
      t.string :name
      t.string :alias
      t.text :look
      t.integer :heritage
      t.text :heritage_description
      t.integer :background
      t.text :background_description
      t.integer :vice
      t.text :vice_description
      t.integer :stress, default: 0
      t.jsonb :trauma, default: []
      t.jsonb :harm, default: { 1 => [], 2 => [], 3 => [] }
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

      t.timestamps
    end
  end
end
