class ChangeItemFromPointsToLoaded < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :points, :integer, default: 0
    add_column :items, :loaded, :boolean, default: false
  end
end
