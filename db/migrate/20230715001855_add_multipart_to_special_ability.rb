class AddMultipartToSpecialAbility < ActiveRecord::Migration[7.0]
  def change
    add_column :special_abilities, :multipart, :boolean, default: false
  end
end
