class SessionsController < ApplicationController
  def new
  end

  def create
      if params[:session].present?
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to root_url, notice: 'Login successful.'
  end

  def destroy
  end
end
