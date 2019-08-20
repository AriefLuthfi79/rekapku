# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate_user!
    return if logged_in?
    flash[:danger] = "Please login"
    redirect_to login_path
  end
end
