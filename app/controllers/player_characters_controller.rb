# frozen_string_literal: true

class PlayerCharactersController < AuthenticatedController
  before_action :set_player_character, only: %i[show edit update destroy]

  def new
    @game = Game.new
  end

  def edit; end

  def update
    respond_to do |format|
      if @player_character.update(player_character_params)
        format.html { redirect_to player_character_url(@player_character), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_characer }
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
        :xp,
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
        :load,
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
