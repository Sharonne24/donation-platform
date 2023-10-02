class SessionsController < ApplicationController
  def new
  end

  def create
      if params[:session].present?
      user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to root_url, notice: 'Login successful.'

      else
        flash.now[:alert] = 'Invalid email/password combination.'
        render :new
      end

    else
      flash.now[:alert] = 'Invalid form submission.'
      render :new
    end
  end

  def destroy
  end
end