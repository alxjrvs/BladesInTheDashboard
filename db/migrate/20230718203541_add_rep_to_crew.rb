class AddRepToCrew < ActiveRecord::Migration[7.0]
  def change
    add_column :crews, :rep, :integer, default: 0
  end
end
