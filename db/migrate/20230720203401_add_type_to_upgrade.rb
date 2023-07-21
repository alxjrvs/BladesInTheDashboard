class AddTypeToUpgrade < ActiveRecord::Migration[7.0]
  def change
    add_column :upgrades, :type, :string
  end
end
