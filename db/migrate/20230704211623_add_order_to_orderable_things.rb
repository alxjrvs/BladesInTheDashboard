# frozen_string_literal: true

class AddOrderToOrderableThings < ActiveRecord::Migration[7.0]
  def change
    add_column :special_abilities, :order, :integer, null: false
    add_column :items, :order, :integer, null: false
    add_column :contacts, :order, :integer, null: false
  end
end
