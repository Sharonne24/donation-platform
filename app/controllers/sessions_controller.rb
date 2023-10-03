class SessionsController < ApplicationController
  def new
  end

  def create
     
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
        render json: {message: "Login success!"}, status: :created
      else
       render json: {error: "Invalid email or password"},status: :unauthorized
      end
  end

  def destroy
    log_out  
    head :no_content
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
  end
end
