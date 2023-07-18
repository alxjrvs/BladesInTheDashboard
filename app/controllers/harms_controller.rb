# frozen_string_literal: true

class HarmsController < AuthenticatedController
  before_action :set_harm, only: %i[update]

  def create
    @harm = @player_character.harms.new(harm_params)
    respond_to do |format|
      if @harm.save
        format.html { redirect_to player_character_url(@harm.player_character), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @harm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @harm.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @harm.update(harm_params)
        format.html { redirect_to player_character_url(@harm.player_character), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @harm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @harm.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_harm
    @harm = Harm.find(params[:id])
  end

  def harm_params
    params.require(:harm).permit(:label, :level)
  end
end
