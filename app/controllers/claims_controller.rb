# frozen_string_literal: true

class ClaimsController < AuthenticatedController
  before_action :set_claim, only: %i[update]

  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to crew_url(@claim.crew), notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @claim }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_claim
    @claim = Claim.find(arams[:id])
  end

  def claim_params
    params.require(:claim).permit(:points)
  end
end
