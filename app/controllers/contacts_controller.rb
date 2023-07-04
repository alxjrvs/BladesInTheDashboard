# frozen_string_literal: true

class ContactsController < AuthenticatedController
  before_action :set_game, only: %i[update]
  before_action :set_player_character, only: %i[update]
  before_action :set_contact, only: %i[update]

  def update
    respond_to do |format|
      if @contact.update(contact_params)
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

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:friend, :rival)
  end
end
