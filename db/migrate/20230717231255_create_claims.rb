class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.belongs_to :source, null: false, polymorphic: true
      t.string :name, null: false
      t.text :description
      t.boolean :claimed, default: false
      t.integer :x_coord, null: false
      t.integer :y_coord, null: false
      t.boolean :right, default: false
      t.boolean :top, default: false
      t.boolean :left, default: false
      t.boolean :bottom, default: false

      t.timestamps
    end
  end
end
