class RenamePlaybookXptoXp < ActiveRecord::Migration[7.0]
  def change
    rename_column :player_characters, :playbook_xp, :xp
  end
end
