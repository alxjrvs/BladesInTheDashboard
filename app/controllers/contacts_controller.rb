# frozen_string_literal: true

class ContactsController < AuthenticatedController
  before_action :set_contact, only: %i[update]

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        url = if @contact.source.instance_of?(PlayerCharacter)
                player_character_url(@contact.source)
              else
                crew_url(@contact.source)
              end

        format.html { redirect_to url, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
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
