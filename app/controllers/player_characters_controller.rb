# frozen_string_literal: true

class PlayerCharactersController < AuthenticatedController
  def show
    @player_character = PlayerCharacter.find(params[:id])
  end
end
