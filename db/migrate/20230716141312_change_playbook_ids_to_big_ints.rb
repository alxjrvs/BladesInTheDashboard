class ChangePlaybookIdsToBigInts < ActiveRecord::Migration[7.0]
  def change
    change_column :player_characters, :playbook_id, :bigint, foreign_key: true
    change_column :items, :playbook_id, :bigint, foreign_key: true
    change_column :contacts, :playbook_id, :bigint, foreign_key: true
    change_column :special_abilities, :playbook_id, :bigint, foreign_key: true
  end
end
