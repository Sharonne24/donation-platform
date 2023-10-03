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
    log_out  
    redirect_to root_url, notice: 'Logged out.'
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end
end
