class AddCrewIdToPlayerCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :player_characters, :crew_id, :bigint, foreign_key: true
  end
end
