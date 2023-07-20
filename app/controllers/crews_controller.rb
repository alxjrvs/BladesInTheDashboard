class CrewsController < ApplicationController
  before_action :set_crew, only: %i[show update]
  def default
    redirect_to player_character_path(PlayerCharacter.first)
  end

  def show; end

  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to crew_url(@crew), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_characer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_crew
    @crew = Crew.find(params[:id])
  end

  def crew_params
    params
      .require(:crew)
      .permit(
        :reputation,
        :reputation_description,
        :lair,
        :lair_description,
        :hunting_ground,
        :hunting_ground_description,
        :turf,
        :hold,
        :tier,
        :heat,
        :vaults,
        :coin,
        :wanted_level,
        :xp,
        :rep
      )
  end
end
