class UsersController < ApplicationController
  def new
    # @user = User.new
    render json: {message: "hello"}
  end

#   def create
#     @user = User.new(user_params)
#     if @user.save
#       redirect_to login_path, notice: 'Registration successful. You can now log in.'
#     else
#       render :new
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :firstname, :secondname, :role)
#   end
end
