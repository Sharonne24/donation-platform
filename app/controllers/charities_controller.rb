class CharitiesController < ApplicationController
  # Display a list of charities
  def index
    charities = Charity.all
    render json: charities
  end

  # Apply to Become a Charity
  def apply
     charity = Charity.create!(charity_params)

    if charity
      render json: { message: "Your charity application has been submitted. We will review it shortly." }, status: :created
    else
      render json: {message: "Application failed"}, status: :internal_server_error
    end
  end

  # show charity details
  def show
    charity = Charity.find(params[:id])
    render json: charity
  end

  # Edit the charity details
  def edit
    charity = Charity.find(params[:id])
    render json: charity
  end
  
  # Update the charity details
  def update
    charity = Charity.find(params[:id])
    if charity.update(charity_params)
      render json: { message: "Charity details were successfully updated." }, status: :created
    else
      render json: {message: "Charity details were not successfully updated"}, status: :internal_server_error
    end
  end

  

  private

  def find_charity
    @charity = Charity.find(params[:id])
  end


  def charity_params
    params.permit(:name, :description, :status, :image_url).merge(user_id: session[:user_id])
  end

  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
