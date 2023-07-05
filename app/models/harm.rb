# frozen_string_literal: true

class Harm < ApplicationRecord
  include BroadcastUpdateable
  belongs_to :player_character

  after_update_commit -> { broadcast_update(player_character) }
end
