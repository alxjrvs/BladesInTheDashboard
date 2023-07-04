# frozen_string_literal: true

class PlayerCharactersController < AuthenticatedController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :set_player_character, only: %i[show edit update destroy]

  def new
    @game = Game.new
  end

  def edit; end

  def update
    respond_to do |format|
      if @player_character.update(player_character_params)
        format.turbo_stream

        format.html { redirect_to game_url(@game), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def player_character_params
    params
      .require(:player_character)
      .permit(
        :playbook_xp,
        :insight_xp,
        :resolve_xp,
        :prowess_xp,
        :stress,
        :armor,
        :special,
        :heavy,
        :name,
        :nickname,
        :look,
        :heritage,
        :heritage_description,
        :background,
        :background_description,
        :vice,
        :vice_description,
        :healing_clock,
        :coin,
        :stash,
        :hunt,
        :study,
        :survey,
        :tinker,
        :finesse,
        :prowl,
        :skirmish,
        :wreck,
        :attune,
        :command,
        :consort,
        :sway
      )
  end
end
