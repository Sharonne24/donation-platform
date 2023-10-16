class CharitiesController < ApplicationController
  before_action :authenticate_user
  # before_action :charity, only: [:apply, :edit, :update, :index]
  # before_action :admin, only: [:index]

  # Display charities based on the different roles
  def index
    if @current_user.role == "admin"
      charities = Charity.all
    elsif @current_user.role == "charity"
      charities = Charity.where(user_id: @current_user.id)
    else 
      charities = Charity.where(status: ["active", "approved"])
    end

    render json: charities
  end

  # Apply to Become a Charity
  def apply
    if @current_user.role == "charity"
      charity = Charity.create!(charity_params)
      render json: { message: "Your charity application has been submitted. We will review it shortly." }, status: :created
    else
      render json: {message: "Unauthorized User"}, status: :internal_server_error
    end
end

  # show charity details
  def show
    charity = Charity.find(params[:id])
    render json: charity
  end

  # Edit the charity details
  # def edit
  #   charity = Charity.find(params[:id])
  #   if @current_user.role == "charity"
  #     render json: { message: "Charity details have been successfully edited." }, status: :created
  #   else
  #     render json: {message: "Unauthorized user"}, status: :internal_server_error
  #   end
  # end
  
  # Update the charity details
  def update
    charity = Charity.find(params[:id])
    if @current_user.role == "charity"
       charity.update(charity_params)
      render json: { message: "Charity details were successfully updated." }, status: :created
    else
      render json: {message: "Unauthorized user"}, status: :internal_server_error
    end
  end

  # Method for admin to view pending charities applied by charities
  def pending
    charities = Charity.where(status: "pending")
    render json: charities
  end

  def approve_reject
    charity = Charity.find(params[:id])
    if @current_user.role == "admin"
       charity.update(status: params[:status])
      render json: { message: "Charity status successfully updated." }, status: :created
    else
      render json: {message: "Charity status not successfully updated"}, status: :internal_server_error
    end
  end

  # Method for admin to check the status of a specific charity
  def check_status
    charity = Charity.find(params[:id])
    render json: { status: charity.status }
  end


  private

  def charity_params
    params.permit(:name, :description, :status, :image_url).merge(user_id: session[:user_id])
  end

  def charity
    unless @current_user.role == "charity"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def admin
    unless @current_user.role == "admin"
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
