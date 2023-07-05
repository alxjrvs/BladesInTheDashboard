# frozen_string_literal: true

class Trauma < ApplicationRecord
  belongs_to :player_character

  enum trauma: { cold: 0, haunted: 1, obsessed: 2, paranoid: 3, reckless: 4, soft: 5, unstable: 6, vicious: 7,
                 unset: 8 }
end
