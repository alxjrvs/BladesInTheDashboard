# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :job, null: false
      t.boolean :friend, default: false
      t.boolean :rival, default: false
      t.integer :playbook_id, foreign_key: true
      t.belongs_to :player_character, null: false

      t.timestamps
    end
  end
end
