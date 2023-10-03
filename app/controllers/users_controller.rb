class UsersController < ApplicationController
  def new
     @user = User.new
     respond_to do |format|
      format.html { head :no_content } 
      format.json { render json: {}, status: :ok } 
    end
  end

  def create
    user = User.create(user_params)
    if user
      # redirect_to login_path, notice: 'Registration successful. You can now log in.'
      render json: {message: "Signup success"}
    else
      # render :new
      render json: {message: "Signup was not successful"}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :firstname, :secondname, :role)
  end
end