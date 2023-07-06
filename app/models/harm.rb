# frozen_string_literal: true

class Harm < ApplicationRecord
  include BroadcastUpdateable
  belongs_to :player_character
end
