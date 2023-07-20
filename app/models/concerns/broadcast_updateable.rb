# frozen_string_literal: true

module BroadcastUpdateable
  extend ActiveSupport::Concern

  included do
    after_update_commit :broadcast_update
  end

  def broadcast_update
    (instance_of?(PlayerCharacter) ? self : player_character).reload
    Turbo::StreamsChannel.broadcast_update_to(
      self,
      target: 'player-character',
      partial: 'player_characters/player_character',
      locals: { player_character: self }
    )
  end
end
