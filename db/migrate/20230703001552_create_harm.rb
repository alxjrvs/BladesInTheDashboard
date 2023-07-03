class CreateHarm < ActiveRecord::Migration[7.0]
  def change
    create_table :harms do |t|
      t.belongs_to :player_character, null: false, foreign_key: truee
      t.string :label, default: ''
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
