class UsersController < ApplicationController
  def new
     @user = User.new
     respond_to do |format|
      format.html { head :no_content } 
      format.json { render json: {}, status: :ok } 
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      format.html { head :no_content } 
      format.json { render json: {}, status: :ok } 
    end
    if @user.save
      redirect_to login_path, notice: 'Registration successful. You can now log in.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :firstname, :secondname)
  end
end