# frozen_string_literal: true

class ChangeAliasToNickname < ActiveRecord::Migration[7.0]
  def change
    rename_column :player_characters, :alias, :nickname
  end
end
