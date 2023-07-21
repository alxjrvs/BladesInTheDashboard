# frozen_string_literal: true

class UpgradesController < ApplicationController
  before_action :set_upgrade, only: %i[update]

  def update
    respond_to do |format|
      if @upgrade.update(upgrade_params)
        format.html { redirect_to crew_url(@upgrade.crew), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @upgrade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upgrade.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_upgrade
    @upgrade = Upgrade.find(params[:id])
  end

  def upgrade_params
    params.require(:upgrade).permit(:points)
  end
end
