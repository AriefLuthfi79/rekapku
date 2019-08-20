class SessionsController < ApplicationController
  layout 'login'

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in user
      forget_or_remember user
      redirect_to dashboards_path
    else
      flash.now[:danger] = "Invalid user email or password"
      render 'new'
    end
  end

  private

  def forget_or_remember(user)
    params[:session][:remember_me] == 1 ? remember(user) : forget(user)
  end
end
