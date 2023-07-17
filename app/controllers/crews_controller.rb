class CrewsController < ApplicationController
  def show
    @crew = Crew.find(params[:id])
  end
end
