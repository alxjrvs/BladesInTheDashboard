# frozen_string_literal: true

class TraumaController < AuthenticatedController
  before_action :set_player_character, only: %i[update]
  before_action :set_trauma, only: %i[update]

  def update
    respond_to do |format|
      if @trauma.update(trauma_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            @trauma.player_character,
            partial: 'player_characters/player_character',
            target: 'dashboard-frame',
            locals: { player_character: @trauma.player_character.reload }
          )
        end
        format.html { redirect_to player_character_url(@player_character), notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_trauma
    @trauma = Trauma.find(params[:id])
  end

  def trauma_params
    params.require(:trauma).permit(:trauma)
  end
end
