# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[update]

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html do
          redirect_to player_character_url(@item.player_character), notice: 'Character was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_character.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:loaded)
  end
end
