class SessionsController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def new
  end

  def create
     
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        log_in(user)
        payload={user_id: user.id}
        token= JWT.encode(payload, ENV["JWT_SECRET"])
        render json: {id: user.id, email: user.email, firstname: user.firstname, secondname: user.secondname, role: user.role, token: token}, status: :created
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
