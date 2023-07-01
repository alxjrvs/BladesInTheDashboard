# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :player_characters, dependent: :destroy
  has_many :players, through: :player_characters, source: :user
  belongs_to :game_master, class_name: 'User', foreign_key: 'user_id'
end
