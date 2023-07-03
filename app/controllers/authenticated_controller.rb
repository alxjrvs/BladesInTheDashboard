# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def set_player_character
    @player_character = PlayerCharacter.find(params[:player_character_id] || params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id] || params[:id])
  end

  def require_admin
    return if current_user.admin?

    redirect_to root_path unless current_user.admin?
    flash[:alert] = 'You must be an admin to do that.'
  end
end
