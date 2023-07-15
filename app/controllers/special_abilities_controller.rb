# frozen_string_literal: true

class SpecialAbilitiesController < AuthenticatedController
  before_action :set_player_character, only: %i[update]
  before_action :set_special_ability, only: %i[update]

  def update
    respond_to do |format|
      if @special_ability.update(special_ability_params)

        format.html { redirect_to player_character_url(@player_character), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_special_ability
    @special_ability = SpecialAbility.find(params[:id])
  end

  def special_ability_params
    params.require(:special_ability).permit(:points)
  end
end
