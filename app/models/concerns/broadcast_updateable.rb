module BroadcastUpdateable
  def broadcast_update(player_character)
    Turbo::StreamsChannel.broadcast_replace_to(
      player_character,
      target: 'dashboard-frame',
      partial: 'player_characters/player_character',
      locals: { player_character: player_character.reload }
    )
  end
end
