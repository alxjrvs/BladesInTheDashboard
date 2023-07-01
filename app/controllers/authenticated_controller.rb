# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  private

  def require_admin
    return if current_user.admin?

    redirect_to root_path unless current_user.admin?
    flash[:alert] = 'You must be an admin to do that.'
  end
end
