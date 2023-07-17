class MoveSpecialAbilitiesAndContactsToPolymorphic < ActiveRecord::Migration[7.0]
  def change
    change_table :contacts do |t|
      t.remove :player_character_id, type: :bigint, null: false
      t.references :source, polymorphic: true, null: false
    end

    change_table :special_abilities do |t|
      t.remove :player_character_id, type: :bigint, null: false
      t.references :source, polymorphic: true, null: false
    end
  end
end
