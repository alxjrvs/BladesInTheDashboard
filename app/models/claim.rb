class Claim < ApplicationRecord
  belongs_to :source, polymorphic: true

  default_scope -> { order(:y_coord, :x_coord) }
end
