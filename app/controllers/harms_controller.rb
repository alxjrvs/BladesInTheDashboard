# frozen_string_literal: true

class HarmsController < AuthenticatedController
  before_action :set_game, only: %i[update]
  before_action :set_player_character, only: %i[update]
  before_action :set_harm, only: %i[update]

  def update
    respond_to do |format|
      if @harm.update(harm_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            @harm.player_character,
            partial: 'player_characters/player_character',
            target: 'dashboard-frame',
            locals: { player_character: @harm.player_character.reload }
          )
        end

        format.html { redirect_to game_url(@game), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_harm
    @harm = Harm.find(params[:id])
  end

  def harm_params
    params.require(:harm).permit(:label)
  end
end
