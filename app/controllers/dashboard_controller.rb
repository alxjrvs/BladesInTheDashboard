# frozen_string_literal: true

class DashboardController < AuthenticatedController
  def index
    @game = Game.first
  end
end
