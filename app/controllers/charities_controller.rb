
class CharitiesController < ApplicationController
  # before_action :authenticate_user!, only: [:apply]


  # Apply to Become a Charity
  def apply
     charity = Charity.create!(charity_params)

    if charity
      render json: { message: "Your charity application has been submitted. We will review it shortly." }, status: :created
    else
      render json: {message: "Application failed"}, status: :internal_server_error
    end
  end

  

  private

  def charity_params
    params.permit(:name, :description, :status, :image_url).merge(user_id: session[:user_id])
  end

  def handle_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
