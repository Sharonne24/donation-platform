class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity
 before_action :authenticate_user, except: [:new, :create]

  def new
     @user = User.new
     respond_to do |format|
      format.html { head :no_content } 
      format.json { render json: {}, status: :ok } 
    end
  end

  def create
    user = User.create!(user_params)
    if user
      payload={user_id: user.id}
        token= JWT.encode(payload, ENV["JWT_SECRET"])
        render json: {id: user.id, email: user.email, firstname: user.firstname, secondname: user.secondname, role: user.role, token: token}, status: :created
    else
      render json: {message: "Signup was not successful"}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :firstname, :secondname, :role)
  end

  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end